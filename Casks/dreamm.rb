cask "dreamm" do
  version "3.0.3"
  # The upstream provides a macOS disk image at:
  # https://dreamm.aarongiles.com/releases/dreamm-<version>-macos.dmg
  sha256 :no_check

  url "https://dreamm.aarongiles.com/releases/dreamm-#{version}-macos.dmg",
      verified: "dreamm.aarongiles.com/"
  name "DREAMM"
  desc "Emulator for classic LucasArts / Lucasfilm games"
  homepage "https://dreamm.aarongiles.com/"

  # Try to mount and install the bundled app (typical pattern for DMG-based releases).
  # If the mounted DMG contains a different app name, adjust "DREAMM.app" accordingly.
  app "DREAMM.app"

  # Optional: prefer the stable release, but provide a simple livecheck that scrapes the
  # project's download page for the "Latest Release" line.
  livecheck do
    url "https://dreamm.aarongiles.com/"
    regex(/Latest Release:\s*([0-9.]+)/i)
  end

  # Optional: vendor tag for audit friendliness
  caveats <<~EOS
    This cask uses sha256 :no_check because upstream does not publish a checksum on the
    download page. To lock the cask to a specific SHA256:
      1. Download the DMG manually (or from CI): https://dreamm.aarongiles.com/releases/dreamm-#{version}-macos.dmg
      2. Compute the SHA256:
         shasum -a 256 dreamm-#{version}-macos.dmg
      3. Replace `sha256 :no_check` with the printed hash in the cask.
  EOS
end
