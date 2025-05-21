cask "tpht-peazip" do
  arch arm: "aarch64",
       intel: "x86_64"

  version "10.4.0"

  sha256 arm: "546686c6f592ffa65bcedd4b47e76487e9ec980301ca4d4f0d9cae02929ee6e0",
         intel: "0a7058c9cabc4be43809a55092c3f1f5fc3bc4bc2a3e7c275ed21a25a0c6d556"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
    verified: "github.com/peazip/PeaZip/"

  name "PeaZip"
  desc "Free Zip / Unzip software and Rar file extractor."
  homepage "https://peazip.github.io"

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
