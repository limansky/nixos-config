{
  cacert,
  fetchurl,
  makeWrapper,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "adguardvpn-cli";
  version = "1.9.0-nightly.1";
  src = fetchurl {
    url = "https://github.com/AdguardTeam/AdGuardVPNCLI/releases/download/v1.9.0-nightly.1/adguardvpn-cli-1.9.0-nightly.1-linux-x86_64.tar.gz";
    sha256 = "9Gb83P8g1DGQWyzMLXonsC41nsBzGf7Vh1g1X1lTziA=";
  };
  phases = ["unpackPhase" "installPhase"];
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
