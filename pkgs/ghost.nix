{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchYarnDeps,
  yarnConfigHook,
  yarnBuildHook,
  yarnInstallHook,
  nodejs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ghost.org";
  version = "5.105.0";

  src = fetchFromGitHub {
    owner = "TryGhost";
    repo = "Ghost";
    rev = "v${finalAttrs.version}";
    hash = "sha256-iHjFR0sh2jBbW9SM1TieUggqL0AU+L8yhmrjzGK6dVM=";
  };

  yarnOffllineCache = fetchYarnDeps {
    yarnLock = finalAttrs.src + "/yarn.lock";
    hash = "sha256-c+hna14IWX+GBF4CyBBIal3QDA8vzJOWJLSFUPVZkYA=";
  };

  nativeBuildInputs = [
    yarnConfigHook
    yarnBuildHook
    yarnInstallHook
    nodejs
  ];

  meta = {
    description = "ghost.org blog";
    mainProgram = "ghost-cli";
    homepage = "https://github.com/TryGhost/Ghost";
    license = lib.licenses.mit;
  };
})
