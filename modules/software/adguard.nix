{
  cacert,
  fetchurl,
  makeWrapper,
  stdenv,
}:

stdenv.mkDerivation {
  pname = "adguardvpn-cli";
  version = "1.8.2-nightly.2";
  src = fetchurl {
    url = "https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v1.8.2-nightly.2/adguardvpn-cli-1.8.2-nightly.2-linux-x86_64.tar.gz";
    sha256 = "62Gc8ZawCcMEgb9Yhbdo/6eX+Q+ox0r/1pCUorExmaM=";
  };
  phases = ["unpackPhase" "installPhase" ];
  nativeBuildInputs = [
    makeWrapper
  ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/opt
    mkdir -p $out/bin
    cp -v adguardvpn-cli adguardvpn-cli.sig bash-completion.sh $out/opt
    makeWrapper $out/opt/adguardvpn-cli $out/bin/adguardvpn-cli \
      --set SSL_CERT_FILE "${cacert}/etc/ssl/certs/ca-bundle.crt"
    runHook postInstall
  '';
}
