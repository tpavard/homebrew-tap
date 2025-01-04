cask "tpht-peazip" do
  arch arm: "aarch64",
       intel: "x86_64"

  version "10.2.0"

  sha256 arm: "79a1947f88cf98c958f508247fa38ebf2e0b08a4a42e653f4aad465f63c5c82d",
         intel: "66835755439a952631f6b3271d31a264402e0d77245f9a3fd21a118be2d8d3ac"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
    verified: "github.com/peazip/PeaZip/"

  name "PeaZip"
  desc "Free Zip / Unzip software and Rar file extractor."
  homepage "https://github.com/peazip/PeaZip"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "peazip.app",
    target: "PeaZip.app"

  caveats <<~EOS
    In order to avoid quarantine, you need to install the app with the following command :
    'brew install --no-quarantine tpht-peazip'

    You can find ".workflow" Automator scripts in the cask installation folder :
    '#{staged_path}/macOS service menus'

    Double click them to install main functions to the right-click context menu.
  EOS

  zap trash: [
    "~/Library/Preferences/com.company.peazip.plist",
    "~/Library/Saved Application State/com.company.peazip.savedState",
    "~/Library/Services/[pP]ea[zZ]ip*.workflow",
  ]
end
