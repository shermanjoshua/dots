#!/bin/bash

set -eufo pipefail

defaults write -g AppleMiniaturizeOnDoubleClick -int 0
defaults write -g ApplePressAndHoldEnabled -int 0
defaults write -g CGDisableCursorLocationMagnification -int 0
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g NSAutomaticCapitalizationEnabled -int 0
defaults write -g NSAutomaticDashSubstitutionEnabled -int 0
defaults write -g NSAutomaticInlinePredictionEnabled -int 0
defaults write -g NSAutomaticPeriodSubstitutionEnabled -int 0
defaults write -g NSAutomaticQuoteSubstitutionEnabled -int 0
defaults write -g NSAutomaticSpellingCorrectionEnabled -int 0
defaults write -g NSAutomaticTextCorrectionEnabled -int 0
defaults write -g NSUserDictionaryReplacementItems '()'
defaults write -g WebAutomaticSpellingCorrectionEnabled -int 0
defaults write -g com.apple.keyboard.fnState -int 1

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true


# #!/usr/bin/env bash
#
# set -x
#
# # Close any open System Preferences panes, to prevent them from overriding
# # settings we’re about to change
# osascript -e 'tell application "System Preferences" to quit'
#
# ###############################################################################
# # General UI/UX                                                               #
# ###############################################################################
#
# # Disable automatic capitalization as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
#
# # Disable smart dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
#
# # Disable automatic period substitution as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
#
# # Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
#
# # Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
#
# ###############################################################################
# # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
# ###############################################################################
#
# # Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#
# # Trackpad: map bottom right corner to right-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple/trackpad.enableSecondaryClick -bool true
#
# # Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
#
# # Set language and text formats
# defaults write NSGlobalDomain AppleLanguages -array "en" "ru"
# defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
# defaults write NSGlobalDomain AppleMetricUnits -bool false
#
# ###############################################################################
# # Screen                                                                      #
# ###############################################################################
#
# # Require password immediately after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0
#
# # Save screenshots to the desktop
# defaults write com.apple.screencapture location -string "$HOME/Desktop"
#
# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string "png"
#
# # Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true
#
# # Enable subpixel font rendering on non-Apple LCDs
# # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
# defaults write NSGlobalDomain AppleFontSmoothing -int 1
#
# ###############################################################################
# # Finder                                                                      #
# ###############################################################################
#
# # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true
#
# # Finder: show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true
#
# # Finder: show status bar
# defaults write com.apple.finder ShowStatusBar -bool true
#
# # Finder: show path bar
# defaults write com.apple.finder ShowPathbar -bool true
#
# # Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
#
# # Keep folders on top when sorting by name
# defaults write com.apple.finder _FXSortFoldersFirst -bool true
#
# # When performing a search, search the current folder by default
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
#
# # Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
#
# # Enable spring loading for directories
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true
#
# # Remove the spring loading delay for directories
# defaults write NSGlobalDomain com.apple.springing.delay -float 0
#
# # Avoid creating .DS_Store files on network or USB volumes
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
#
# # Use list view in all Finder windows by default
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
# defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
#
# # Expand the following File Info panes:
# # “General”, “Open with”, and “Sharing & Permissions”
# defaults write com.apple.finder FXInfoPanesExpanded -dict \
# 	General -bool true \
# 	OpenWith -bool true \
# 	Privileges -bool true
#
# ###############################################################################
# # Dock, Dashboard, and hot corners                                            #
# ###############################################################################
#
# # Enable highlight hover effect for the grid view of a stack (Dock)
# defaults write com.apple.dock mouse-over-hilite-stack -bool true
#
# # Set the icon size of Dock items to 64 pixels
# defaults write com.apple.dock tilesize -int 64
#
# # Change minimize/maximize window effect
# defaults write com.apple.dock mineffect -string "scale"
#
# # Minimize windows into their application’s icon
# defaults write com.apple.dock minimize-to-application -bool true
#
# # Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
#
# # Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true
#
# # Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false
#
# # Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1
#
# # Don’t group windows by application in Mission Control
# # (i.e. use the old Exposé behavior instead)
# defaults write com.apple.dock expose-group-by-app -bool false
#
# # Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true
#
# # Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true
#
# # Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false
#
# # Remove the auto-hiding Dock delay
# defaults write com.apple.dock autohide-delay -float 0
# # Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0
#
# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool false
#
# # Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true
#
# # Don’t show recent applications in Dock
# defaults write com.apple.dock show-recents -bool false
#
# # Hot corners
# # Possible values:
# #  0: no-op
# #  2: Mission Control
# #  3: Show application windows
# #  4: Desktop
# #  5: Start screen saver
# #  6: Disable screen saver
# #  7: Dashboard
# # 10: Put display to sleep
# # 11: Launchpad
# # 12: Notification Center
# # 13: Lock Screen
# # Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0
#
# ###############################################################################
# # Safari & WebKit                                                             #
# ###############################################################################
#
# # Privacy: don’t send search queries to Apple
# defaults write com.apple.Safari UniversalSearchEnabled -bool false
# defaults write com.apple.Safari SuppressSearchSuggestions -bool true
#
# # Press Tab to highlight each item on a web page
# defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
#
# # Show the full URL in the address bar (note: this still hides the scheme)
# defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
#
# # Set Safari’s home page to `about:blank` for faster loading
# defaults write com.apple.Safari HomePage -string "about:blank"
#
# # Prevent Safari from opening ‘safe’ files automatically after downloading
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
#
# # Allow hitting the Backspace key to go to the previous page in history
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
#
# # Hide Safari’s bookmarks bar by default
# defaults write com.apple.Safari ShowFavoritesBar -bool false
#
# # Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
#
# # Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
#
# # Enable Safari’s debug menu
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
#
# # Make Safari’s search banners default to Contains instead of Starts With
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
#
# # Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"
#
# # Enable the Develop menu and the Web Inspector in Safari
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
#
# # Add a context menu item for showing the Web Inspector in web views
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
#
# # Enable continuous spellchecking
# defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# # Disable auto-correct
# defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
#
# # Disable AutoFill
# defaults write com.apple.Safari AutoFillFromAddressBook -bool false
# defaults write com.apple.Safari AutoFillPasswords -bool false
# defaults write com.apple.Safari AutoFillCreditCardData -bool false
# defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
#
# # Warn about fraudulent websites
# defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
#
# # Disable plug-ins
# defaults write com.apple.Safari WebKitPluginsEnabled -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false
#
# # Disable Java
# defaults write com.apple.Safari WebKitJavaEnabled -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false
#
# # Block pop-up windows
# defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
#
# # Disable auto-playing video
# #defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
# #defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
# #defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
# #defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#
# # Enable “Do Not Track”
# defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
#
# # Update extensions automatically
# defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
#
# ###############################################################################
# # Mail                                                                        #
# ###############################################################################
#
# # Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true
#
# # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
#
# # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"
#
# # Display emails in threaded mode, sorted by date (oldest at the top)
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"
#
# # Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
#
# # Disable automatic spell checking
# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"
#
# ###############################################################################
# # Terminal & iTerm 2                                                          #
# ###############################################################################
#
# # Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4
#
# # Enable “focus follows mouse” for Terminal.app and all X11 apps
# # i.e. hover over a window and start typing in it without clicking first
# #defaults write com.apple.terminal FocusFollowsMouse -bool true
# #defaults write org.x.X11 wm_ffm -bool true
#
# # Enable Secure Keyboard Entry in Terminal.app
# # See: https://security.stackexchange.com/a/47786/8918
# defaults write com.apple.terminal SecureKeyboardEntry -bool true
#
# # Disable the annoying line marks
# defaults write com.apple.Terminal ShowLineMarks -int 0
#
# # Don’t display the annoying prompt when quitting iTerm
# defaults write com.googlecode.iterm2 PromptOnQuit -bool false
#
# ###############################################################################
# # Time Machine                                                                #
# ###############################################################################
#
# # Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
#
# ###############################################################################
# # Activity Monitor                                                            #
# ###############################################################################
#
# # Show the main window when launching Activity Monitor
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
#
# # Visualize CPU usage in the Activity Monitor Dock icon
# defaults write com.apple.ActivityMonitor IconType -int 5
#
# # Show all processes in Activity Monitor
# defaults write com.apple.ActivityMonitor ShowCategory -int 0
#
# # Sort Activity Monitor results by CPU usage
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0
#
# ###############################################################################
# # Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
# ###############################################################################
#
# # Enable the debug menu in Address Book
# defaults write com.apple.addressbook ABShowDebugMenu -bool true
#
# # Enable Dashboard dev mode (allows keeping widgets on the desktop)
# defaults write com.apple.dashboard devmode -bool true
#
# # Enable the debug menu in iCal (pre-10.8)
# defaults write com.apple.iCal IncludeDebugMenu -bool true
#
# # Use plain text mode for new TextEdit documents
# defaults write com.apple.TextEdit RichText -int 0
# # Open and save files as UTF-8 in TextEdit
# defaults write com.apple.TextEdit PlainTextEncoding -int 4
# defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
#
# # Enable the debug menu in Disk Utility
# defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
# defaults write com.apple.DiskUtility advanced-image-options -bool true
#
# # Auto-play videos when opened with QuickTime Player
# defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true
#
# ###############################################################################
# # Mac App Store                                                               #
# ###############################################################################
#
# # Enable the WebKit Developer Tools in the Mac App Store
# defaults write com.apple.appstore WebKitDeveloperExtras -bool true
#
# # Enable Debug Menu in the Mac App Store
# defaults write com.apple.appstore ShowDebugMenu -bool true
#
# # Enable the automatic update check
# defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
#
# # Check for software updates daily, not just once per week
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
#
# # Download newly available updates in background
# defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
#
# # Install System data files & security updates
# defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
#
# # Automatically download apps purchased on other Macs
# defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
#
# # Turn on app auto-update
# defaults write com.apple.commerce AutoUpdate -bool true
#
# # Allow the App Store to reboot machine on macOS updates
# defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
#
# ###############################################################################
# # Photos                                                                      #
# ###############################################################################
#
# # Prevent Photos from opening automatically when devices are plugged in
# defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
#
# ###############################################################################
# # Google Chrome & Google Chrome Canary                                        #
# ###############################################################################
#
# # Disable the all too sensitive backswipe on trackpads
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
#
# # Disable the all too sensitive backswipe on Magic Mouse
# defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
# {{ if not .host.restricted }}
# ###############################################################################
# # Settings that require administrator permissions                             #
# ###############################################################################
#
# # Ask for the administrator password upfront
# sudo -v
#
# # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
#
# # Show language menu in the top right corner of the boot screen
# sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
#
# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "America/New_York" > /dev/null
#
# # Enable lid wakeup
# sudo pmset -a lidwake 1
#
# # Sleep the display after 15 minutes
# sudo pmset -a displaysleep 15
#
# # Disable machine sleep while charging
# sudo pmset -c sleep 0
#
# # Set machine sleep to 5 minutes on battery
# sudo pmset -b sleep 5
#
# # Enable HiDPI display modes (requires restart)
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
#
# # Show the ~/Library folder
# sudo chflags nohidden ~/Library
#
# # Show the /Volumes folder
# sudo chflags nohidden /Volumes
# {{- end -}}
