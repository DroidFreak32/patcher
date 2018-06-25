#!/bin/sh

# Apply these patches before compilation:
CUSTOM=$PWD/patcher/custom
SULTAN=$PWD/patcher/sultan

# Clean up first
git -C frameworks/base			clean -dfqx
git -C frameworks/base			reset -q --hard
git -C packages/apps/Gallery2		clean -dfqx
git -C packages/apps/Gallery2		reset -q --hard
git -C packages/apps/LockClock		clean -dfqx
git -C packages/apps/LockClock		reset -q --hard
git -C system/core			clean -dfqx
git -C system/core			reset -q --hard
git -C vendor/cm			clean -dfqx
git -C vendor/cm			reset -q --hard

### Sultan's patches
git -C frameworks/base			apply $SULTAN/frameworks-base1.patch
git -C frameworks/base			apply $SULTAN/frameworks-base3.patch
git -C packages/apps/LockClock		apply $SULTAN/packages-apps-LockClock0.patch
git -C system/core			apply $SULTAN/system-core0.patch
git -C system/core			apply $SULTAN/system-core1.patch
git -C vendor/cm			apply $SULTAN/vendor-cm0.patch

### Custom patches
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery20.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery21.patch
git -C packages/apps/Gallery2		apply $CUSTOM/packages-apps-Gallery22.patch
