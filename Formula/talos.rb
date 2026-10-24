class Talos < Formula
  include Language::Python::Virtualenv

  desc "Local autonomous agent with a deterministic security kernel"
  homepage "https://talos-agent.ch"
  url "https://github.com/talos-kernel/Talos/releases/download/v0.20.0-beta.6/talos-0.20.0-beta.6.tar.gz"
  version "0.20.0-beta.6"
  sha256 "fe80a32dd75d563c808ecaf8dc9f331c1af451ef5805afd064c433a121c07f1b"
  license "MIT"

  depends_on :macos
  on_macos do
    depends_on macos: :sonoma
  end
  depends_on arch: :arm64
  depends_on "python@3.13"

  # Upstream wheels already carry self-contained loader-relative libraries.
  # Keep them archived through Homebrew's Mach-O rewrite, then install verbatim.
  deny_network_access! :postinstall
  post_install_steps do
    run "{{HOMEBREW_PREFIX}}/opt/python@3.13/bin/python3.13",
        args: ["-m", "pip", "--isolated", "--disable-pip-version-check",
               "--python={{libexec}}/.venv/bin/python", "install", "--no-index",
               "--no-deps", "--only-binary=:all:", "--require-hashes",
               "--find-links={{libexec}}/wheelhouse", "-r", "{{libexec}}/requirements.lock"]
    run "{{HOMEBREW_PREFIX}}/opt/python@3.13/bin/python3.13",
        args: ["-m", "pip", "--isolated", "--python={{libexec}}/.venv/bin/python", "check"]
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/da/35/f2287558c17e29fafc8ef3daf819bb9834061cfa43bff8014f7df7f63bdc/anyio-4.14.2-py3-none-any.whl"
    sha256 "9f505dda5ac9f0c8309b5e8bd445a8c2bf7246f3ce950121e45ea15bc41d1494"
  end

  resource "av" do
    url "https://files.pythonhosted.org/packages/3f/c9/37a619297492256b77d5ed906e7d8166c10a26ed251dccf1ae03ab19bff6/av-18.1.0-cp311-abi3-macosx_14_0_arm64.whl"
    sha256 "b30a4e8d934558e19602b68998a4d9ac9f250fa0dacef216f7e8e40153b13316"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/c4/51/29046e48f693c54e5b7412216d447a1d8362c9653148d98c02cdf65fa733/certifi-2026.10.19-py3-none-any.whl"
    sha256 "42d35340cc5b9ba78e818ddbff0c5b1c2b779de448a340fd1b989f5fa8670e1b"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/55/41/4c7042f317b9217502988f0873af87e16ad606dc20f84e546e3e6ce9764c/cffi-2.1.1-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "19ee6127ee34de7d83ce3d371ebc5ed91addbdcc39f9ab15ce4eb35a4e534971"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/a4/a0/562247944386f7d4ef94467e84876600cc1e0f1b93239aaa9213d2bc3cbd/charset_normalizer-3.5.1-cp313-cp313-macosx_10_13_universal2.whl"
    sha256 "e90251c0c7bdd54a100a0dce3c07b7e637278c93af29dbf78ebb89a58c4bac7d"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/58/50/6c0d534c5f134586a8e1ba4e330569e32f057e33372ae556463212fb4cd3/click-8.5.0-py3-none-any.whl"
    sha256 "255bc9599cf7748b4b1a446ccc735421bd08a2ae529a8b88597d3de5664ee360"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/ba/19/797e2aaac9df6a66f1550f49979dc1b1e39ecd2077501c30efa81e8d5d67/cryptography-50.0.1-cp311-abi3-macosx_11_0_arm64.whl"
    sha256 "b8f852c65863251b9e3a1b8c150ce21e59b522dbb6a7d4bc80e680d38388e986"
  end

  resource "ctranslate2" do
    url "https://files.pythonhosted.org/packages/2c/00/3f5d12d94daa22ddf51de0252313476c0f8fca8b1c7776592953764a8b85/ctranslate2-4.8.2-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "a40b190248389e1adb38ff90407937131c6bb9d7f9771f29ca1dca01946ff252"
  end

  resource "ddgs" do
    url "https://files.pythonhosted.org/packages/f9/0c/b43a87e81e45caf2c30fea9a5914dfd17b83a9f3c2c59ae22b6257bcf083/ddgs-9.16.0-py3-none-any.whl"
    sha256 "175d9198c958a263f51a06a54368ba0b41294942c0cd29f4aa71be03dbcd5f4a"
  end

  resource "faster-whisper" do
    url "https://files.pythonhosted.org/packages/05/99/49ee85903dee060d9f08297b4a342e5e0bcfca2f027a07b4ee0a38ab13f9/faster_whisper-1.2.1-py3-none-any.whl"
    sha256 "79a66ad50688c0b794dd501dc340a736992a6342f7f95e5811be60b5224a26a7"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/e0/1b/5e74289a1878e666bb4b65fe5805a04cafcac2aa5f519ef1ead67ef91c56/filelock-4.2.4-py3-none-any.whl"
    sha256 "301241438c57936ef93f4243a94f2559022268bfcf9b375a9a72eb0f8db8358e"
  end

  resource "flatbuffers" do
    url "https://files.pythonhosted.org/packages/e8/2d/d2a548598be01649e2d46231d151a6c56d10b964d94043a335ae56ea2d92/flatbuffers-25.12.19-py2.py3-none-any.whl"
    sha256 "7634f50c427838bb021c2d66a3d1168e9d199b0607e6329399f04846d42e20b4"
  end

  resource "fsspec" do
    url "https://files.pythonhosted.org/packages/fd/3c/6a2bf344106328fd04963664a60b9bb6496fc25df8e962fcdc1367285fb9/fsspec-2026.7.0-py3-none-any.whl"
    sha256 "b57ddbafedfaef7018c1ecab32aa200a9d7ca26b77965f64e48b70061249d279"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "hf-xet" do
    url "https://files.pythonhosted.org/packages/4b/69/55b8dcf636142ae660fec1869fcac14c4da2e8412e14d6eee1523be77e9f/hf_xet-1.6.0-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "f0906082d9932ae0c0057fa194041c22b4e2cdb46b2592ef3b91f020d62a081a"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "huggingface-hub" do
    url "https://files.pythonhosted.org/packages/4e/a5/47c2ea9b228ccbcba8467e9a64823146e8ebbad29855e591d8f5eedcc9c7/huggingface_hub-1.29.0-py3-none-any.whl"
    sha256 "b00f7782afc14db4bc6572763810a635bdfbab8623d957bfb553bd18e03852cd"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/57/b0/0e52c878c53f245edd3a11020f20979b3f490f245af532c7cae3027754b5/idna-3.19-py3-none-any.whl"
    sha256 "815e7be7a7806d54abb586dc943addc79e8b2ee16915059658cbeff4b1b43bf4"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/61/2a/e9651f47a31a60b5cae031abc23391ed9aa30c8fc07571d1a38f58d6d770/lxml-6.1.2-cp313-cp313-macosx_10_13_universal2.whl"
    sha256 "351318f5c0eb7fcab5b4fdb507c6f88fb2c4b5e67784c7e5911448c91fffb5d4"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/3c/79/81e0bf24f4d020a2b1d5cd297a9f60c3f24eeb116f9bba5870443f7b6a4a/numpy-2.5.2-cp313-cp313-macosx_14_0_arm64.whl"
    sha256 "29d81e97f668489cba8ebfd796b9bdd453525d35dd9e162e2daec94bf3fc7740"
  end

  resource "onnxruntime" do
    url "https://files.pythonhosted.org/packages/41/f8/d375facf60edaf41f5732f9f689c98a800fcc52df5cf6ddfb406703eb5a1/onnxruntime-1.29.0-cp313-cp313-macosx_14_0_arm64.whl"
    sha256 "be0f8ed688cfb1d4d5765a137193b7bfab0c8ea214eed99260b380bb525a3a7f"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/63/34/ba1c580383c9eada3711951fef0795c80b829a078d72188184bcab9dd527/packaging-26.3-py3-none-any.whl"
    sha256 "d7193f7c8e4e93f444fde0262bf90af30e16fa0ad0ad44cb553c87339b23cd1c"
  end

  resource "primp" do
    url "https://files.pythonhosted.org/packages/76/8d/c62601ab82b831e12b1dee9ad9e7de2082c33a8774c4e71a76c3f0f76af3/primp-2.0.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "c55f8ab86b7cc076b34ee0316ded6c30e9932ea010aeae3f8fe5cf30d9ecccf7"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/f7/6c/3a54a58f2948b0f485df9ecdd06590f15d0a7abf46a89d50c3de709ff4ff/protobuf-7.36.1-cp310-abi3-macosx_10_9_universal2.whl"
    sha256 "3cf2ee25d006cee57294a1196ea43b37feb78e0dcd1e8af5c1aeddb777655aca"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl"
    sha256 "b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992"
  end

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/1b/4d/c9d2d67f204eff463237a1a8f5e25a6923b7b1043982b91fcaf104c8ef60/pypdf-6.21.2-py3-none-any.whl"
    sha256 "1d44d1a3a200f25062adff0085b02040e4646431ac2ccac22e42679e91466084"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/b1/16/95309993f1d3748cd644e02e38b75d50cbc0d9561d21f390a76242ce073f/pyyaml-6.0.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "2283a07e2c21a2aa78d9c4442724ec1eb15f5e42a723b99cb3d822d48f5f7ad1"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a0/f4/c67b0b3f1b9245e8d266f0f112c500d50e5b4e83cb6f3b71b6528104182a/requests-2.34.2-py3-none-any.whl"
    sha256 "2a0d60c172f83ac6ab31e4554906c0f3b3588d37b5cb939b1c061f4907e278e0"
  end

  resource "tokenizers" do
    url "https://files.pythonhosted.org/packages/e2/6a/068ed9f6e444c9d7e9d55ce134181325700f3d7f30410721bdc8f848d727/tokenizers-0.23.1-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "e0948bbb1ac1d7cdfc9fb6d62c596e3b7550036ad60ecd654a66ad273326324e"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/f9/1c/01bfd571a64e7f270e6bab5e33777debe0edc56759233ce84f27dec92d14/tqdm-4.70.0-py3-none-any.whl"
    sha256 "7f585706bfddbdebf89daac705b2dfcc16890130727d3197ca62c732b4310953"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/92/9d/c4e665119135114480843e7ab388fa94d8480650450e6f8e26b70d323a4c/urllib3-2.8.0-py3-none-any.whl"
    sha256 "0cf3cae568d36aa9576b28dfb35f11328f1cb974ca7647d9475ebb86c75ac6e3"
  end

  def install
    libexec.install Dir["*"]
    libexec.install ".env.example"
    wheelhouse = libexec/"wheelhouse"
    # Keep the original wheels intact; pip enforces the signed runtime lock.
    wheelhouse.mkpath
    resources.each do |wheel|
      FileUtils.cp wheel.cached_download, wheelhouse/File.basename(wheel.url)
    end
    python = Formula["python@3.13"].opt_bin/"python3.13"
    virtualenv_create(libexec/".venv", python, system_site_packages: false)
    # Code stays in Cellar. No install/post_install hook creates user state.
    (libexec/".talos-install-manager").write "homebrew\n"
    (bin/"talos").write_env_script libexec/"bin/talos",
      TALOS_INSTALL_MANAGER: "homebrew", PYTHONDONTWRITEBYTECODE: "1"
  end

  def caveats
    <<~EOS
      Start with: talos setup terminal
      Then run:   talos chat

      Your private profile is ~/.talos/homebrew (mode 700).
      Configuration, identity, projects and work survive package replacement.
      No other Talos installation is imported automatically.
      Upgrade with: brew upgrade talos
      Package rollback also retains the profile; uninstall does not delete it.
      Supported: Apple Silicon, macOS 14 or later.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{(bin/"talos").to_s.shellescape} version")
    assert_match "no event log yet", shell_output("#{(bin/"talos").to_s.shellescape} status")
    assert_match "brew upgrade", shell_output("#{(bin/"talos").to_s.shellescape} update", 1)
    assert_match "brew upgrade", shell_output("#{(bin/"talos").to_s.shellescape} update --prefix #{(testpath/"elsewhere").to_s.shellescape}", 1)
    refute_path_exists testpath/".talos/homebrew"
    system libexec/".venv/bin/python", "-c",
           "import av, ctranslate2, onnxruntime, cryptography, faster_whisper, ddgs, pypdf; " \
           "from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey; " \
           "key=Ed25519PrivateKey.generate(); msg=b'talos-install-proof'; " \
           "key.public_key().verify(key.sign(msg), msg)"
    # Homebrew post-processing must not rewrite upstream wheel Mach-O payloads.
    native_integrity = <<~PYTHON
      import hashlib, pathlib, sys, sysconfig, zipfile
      installed = pathlib.Path(sysconfig.get_paths()["platlib"])
      checked = 0
      for wheel in pathlib.Path(sys.argv[1]).glob("*.whl"):
          with zipfile.ZipFile(wheel) as archive:
              for name in archive.namelist():
                  if not name.endswith((".dylib", ".so")):
                      continue
                  target = installed / name
                  assert target.is_file(), name
                  assert hashlib.sha256(target.read_bytes()).digest() == hashlib.sha256(archive.read(name)).digest(), name
                  checked += 1
      assert checked > 0
      print(f"UPSTREAM_NATIVE_BYTES_UNCHANGED {checked}")
    PYTHON
    system libexec/".venv/bin/python", "-c", native_integrity, libexec/"wheelhouse"
  end
end
