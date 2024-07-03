cask "tpht-peazip" do
  arch arm: "aarch64",
       intel: "x86_64"

  version "9.8.0"

  sha256 arm: "5fba1cc7f69f1a445e7fea04fbf07e28e23189d7ba301451da3d49368e6c77c1",
         intel: "ccb608ea543ba29dc6b992537d144475ab21f68ec03abd8a78b728cf0aaebf5e"

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
