cask "tpht-peazip" do
  arch arm: "aarch64",
       intel: "x86_64"

  version "10.5.0"

  sha256 arm: "fa120c735680c3ae9ebbd3e1ddf0933eab53dea20ff5862a543154efea397ecf",
         intel: "49e365c7e71dc74e27d97f5bb73a2312a9b97ee4278e1032fe7f4f4080a9cdc3"

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
