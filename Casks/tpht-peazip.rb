cask "tpht-peazip" do
  arch arm: "aarch64",
       intel: "x86_64"

  version "9.9.0"

  sha256 arm: "db263bd35d3fe5da4b5bb0eebef4a9209c2a371a8c2c495cf5c73a8ac3db1afc",
         intel: "8b2eb492396ceab34860c53f3611a126c576198377dbbb149b9329ea298c5545"

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

    You can find Automator ".workflow" scripts in the cask installation folder :
    '#{staged_path}/macOS service menus'

    You can double click them to install main functions to the right-click context menu.
  EOS

  zap trash: [
    "~/Library/Preferences/com.company.peazip.plist",
    "~/Library/Saved Application State/com.company.peazip.savedState",
    "~/Library/Services/[pP]ea[zZ]ip*.workflow",
  ]
end
