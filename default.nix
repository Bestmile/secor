with import <nixpkgs> {}; {
  bmSevorEnv = stdenv.mkDerivation rec {
    name = "BM-Secor";
    buildInputs = [
      maven
      thrift
    ];
    shellHook = ''
      export NIX_LABEL="${name}"
      mkdir -p target/generated-sources/thrift
      mkdir -p target/generated-test-sources/thrift
      thrift -o target/generated-sources/thrift --gen java src/main/thrift/secor.thrift
      thrift -o target/generated-test-sources/thrift --gen java src/test/thrift/unittest.thrift
    '';
  };
}
