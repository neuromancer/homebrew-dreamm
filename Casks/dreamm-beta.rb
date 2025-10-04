cask "dreamm-beta" do
  version "4.0b18"
  sha256 :no_check

  url "https://dreamm.aarongiles.com/releases/4.0/dreamm-#{version}-macos.dmg",
      verified: "dreamm.aarongiles.com/"
  name "DREAMM Beta"
  desc "Beta version of the DREAMM emulator (early access)"
  homepage "https://dreamm.aarongiles.com/beta/"

  # Rename to avoid overwriting stable install
  app "DREAMM.app", target: "DREAMM Beta.app"

  livecheck do
    url "https://dreamm.aarongiles.com/beta/"
    regex(/Latest Release:\s*([0-9.]+b\d+)/i)
  end

  # Prevent installing alongside stable
  conflicts_with cask: "dreamm"

  caveats <<~EOS
    This beta build installs as “DREAMM Beta.app”.
    It conflicts with the stable DREAMM cask and cannot be installed simultaneously.
  EOS
end

