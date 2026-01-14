import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Scope {
	// This stores all the information shared between the lock surfaces on each screen.
	LockContext {
		id: lockContext

		onUnlocked: {
			// Unlock the screen before exiting, or the compositor will display a
			// fallback lock you can't interact with.
			lock.locked = false;

		}
	}

	WlSessionLock {
		id: lock

		// Lock the session immediately when quickshell starts.
		locked: false

		WlSessionLockSurface {
			LockSurface {
				anchors.fill: parent
				context: lockContext
			}
		}
	}

    IpcHandler {
        target: "lockscreen"
        function lock() {
            lock.locked = true;
        }
        function unlock() {
            lock.locked = false;
        }
    }
}