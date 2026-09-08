class VitCli < Formula
  include Language::Python::Virtualenv

  desc "Attach visuals (images, GIFs, videos) to Git commits"
  homepage "https://github.com/andrewleachtx/vit"
  url "https://github.com/andrewleachtx/vit/releases/download/v0.2.0/vit-0.2.0-py3-none-any.whl",
      using: :nounzip
  version "0.2.0"
  sha256 "ee8e459185cd7bb03a558bd8897ecb333a7e360d62f0aaff4e477730ffb0101f"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link(
      buildpath/"vit-0.2.0-py3-none-any.whl",
      build_isolation: false,
    )
  end

  test do
    system "git", "init", "-q"
    system "git", "-c", "user.name=Vit Test",
                  "-c", "user.email=vit@example.invalid",
                  "-c", "commit.gpgsign=false",
                  "commit", "--allow-empty", "-qm", "First render"

    (testpath/"render.png").write("example image contents")

    assert_match "Attached 1 file", shell_output("#{bin}/vit attach render.png")
    assert_match "render.png", shell_output("#{bin}/vit show")
  end
end