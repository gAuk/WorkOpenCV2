PROJECT=WorkOpenCV2.xcodeproj
WORKSPACE=WorkOpenCV2.xcworkspace
SCHEME=WorkOpenCV2
TEST_SDK=iphonesimulator
CONFIGURATION_DEBUG=Debug
DESTINATION="platform=iOS Simulator,name=iPhone 6 Plus,OS=8.1"

defualt: pod test

# pod  - setup CocoaPods
pod:
	pod install

# test - clean, build, XCTest
test:
	xcodebuild \
	-workspace $(WORKSPACE) \
	-scheme $(SCHEME) \
	-sdk $(TEST_SDK) \
	-configuration $(CONFIGURATION_DEBUG) \
	-destination $(DESTINATION) \
	clean build test
