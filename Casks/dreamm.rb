cask "dreamm" do
  version "3.0.3"
  sha256 :no_check

  url "https://dreamm.aarongiles.com/releases/dreamm-#{version}-macos.dmg",
      verified: "dreamm.aarongiles.com/"
  name "DREAMM"
  desc "Emulator for classic LucasArts / Lucasfilm games"
  homepage "https://dreamm.aarongiles.com/"

  app "DREAMM.app"

  livecheck do
    url "https://dreamm.aarongiles.com/"
    regex(/Latest Release:\s*([0-9.]+)/i)
  end

  # Prevent installing alongside beta
  conflicts_with cask: "dreamm-beta"

  caveats <<~EOS
    Cannot be installed at the same time as dreamm-beta.
  EOS
end
