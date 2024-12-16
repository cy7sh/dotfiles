{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchYarnDeps,
  yarnConfigHook,
  yarnInstallHook,
  yarnBuildHook,
  nodejs,
  faketty,
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

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = finalAttrs.src + "/yarn.lock";
    hash = "sha256-c+hna14IWX+GBF4CyBBIal3QDA8vzJOWJLSFUPVZkYA=";
  };

  nativeBuildInputs = [
    yarnConfigHook
    yarnInstallHook
    yarnBuildHook
    nodejs
    faketty
  ];

  buildPhase = ''
    # Workaround for https://github.com/nrwl/nx/issues/22445
    runHook preBuild
    faketty yarn --offline build
    runHook postBuild
  '';

  meta = {
    description = "ghost.org blog";
    mainProgram = "ghost";
    homepage = "https://github.com/TryGhost/Ghost";
    license = lib.licenses.mit;
  };
})
