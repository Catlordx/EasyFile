use anyhow::Result;
use windows::{
    core::{w, PCWSTR},
    Win32::{
        Foundation::{HWND, RECT},
        UI::WindowsAndMessaging::{
            FindWindowExA, FindWindowExW, GetForegroundWindow, GetSystemMetrics, GetWindowRect,
            SetWindowPos, SM_CXSCREEN, SM_CYSCREEN, SWP_NOSIZE, SWP_NOZORDER,
        },
    },
};

const WINDOW_WIDTH: i32 = 1024;
const WINDOW_HEIGHT: i32 = 768;

/// move the window to the center of screen and turn its
/// size to (1024 * 768)
#[flutter_rust_bridge::frb(sync)]
pub fn to_center() -> Result<()> {
    unsafe {
        // Get current window handle
        // let hwnd = GetForegroundWindow();
        let window_name_w = w!("FLUTTER_RUNNER_WIN32_WINDOW");
        let hwnd = FindWindowExW(
            HWND(std::ptr::null_mut()), // hwndParent
            HWND(std::ptr::null_mut()), // hwndChildAfter
            window_name_w,
            PCWSTR::null(), // lpszWindow
        )
        .unwrap();
        let screen_width = GetSystemMetrics(SM_CXSCREEN);
        let screen_height = GetSystemMetrics(SM_CYSCREEN);

        let mut window_rect = RECT::default();
        GetWindowRect(hwnd, &mut window_rect)?;

        let window_width = window_rect.right - window_rect.left;
        let window_height = window_rect.bottom - window_rect.top;

        let x = (screen_width - window_width) / 2;
        let y = (screen_height - window_height) / 2;

        // 移动窗口
        SetWindowPos(
            hwnd,
            HWND(std::ptr::null_mut()),
            x,
            y,
            WINDOW_WIDTH,
            WINDOW_HEIGHT,
            SWP_NOSIZE | SWP_NOZORDER,
        )?;
    }

    Ok(())
}
