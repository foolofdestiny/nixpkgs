{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "kubespy";
  version = "0.6.1";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "pulumi";
    repo = "kubespy";
    sha256 = "sha256-ChHrDAmPUjdyiF+XQONQMDN3UZQMM80BR+m+E8o3gnw=";
  };

  vendorSha256 = "sha256-HmMh5jrRGs4rtN9GLddS9IwITyvVmOrL5TShhQeyxKU=";

  doCheck = false;

  # TODO: enable after https://github.com/pulumi/kubespy/issues/72 is addressed.
  # postInstall = ''
  # 	for shell in bash zsh; do
  # 		$out/bin/kubespy completion $shell > kubespy.$shell
  # 		installShellCompletion kubespy.$shell
  # 	done
  # '';

  meta = with lib; {
    description = "A tool to observe Kubernetes resources in real time";
    homepage = "https://github.com/pulumi/kubespy";
    license = licenses.asl20;
    maintainers = with maintainers; [ blaggacao ];
    platforms = platforms.unix;
  };
}
