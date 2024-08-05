// VeHinh.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "VeHinh.h"

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

HMENU hMenu;
int hinh;
int mau;
HPEN hPen;
HBRUSH hBrush;
// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_VEHINH, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_VEHINH));

    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_VEHINH));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_VEHINH);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Store instance handle in our global variable
   hMenu = LoadMenu(hInstance, MAKEINTRESOURCE(IDR_MENU1));

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, hMenu, hInstance, nullptr);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE: Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
        static int x, y, x1, y1;
        static HDC hdc;
        static POINT pointSao[8];
        case WM_LBUTTONDOWN:
            x = LOWORD(lParam);
            y = HIWORD(lParam);
            break;
        case WM_LBUTTONUP:
            x1 = LOWORD(lParam);
            y1 = HIWORD(lParam);
            hdc = GetDC(hWnd);

            if (mau == 1)
            {
                hBrush = CreateSolidBrush(RGB(0, 255, 0));

            }
            else if (mau == 2)
            {
                hBrush = CreateSolidBrush(RGB(0, 255, 255));

            }
            if (mau == 3)
            {
                hPen = CreatePen(PS_DASHDOT, 1.5, RGB(255, 0, 0));

            }
            else if (mau == 4)
            {
                hPen = CreatePen(PS_DASHDOT, 1.5, RGB(0, 255, 255));

            }
            SelectObject(hdc, hPen);
            SelectObject(hdc, hBrush);
           
            if (hinh == 1)
            {
                Rectangle(hdc, x, y, x1, y1);
            }
            else if (hinh == 2)
            {
                Ellipse(hdc, x, y, x1, y1);
            }
            else if (hinh == 3)
            {
                // sao 4 canh
                pointSao[0].x = x + (x1 - x) / 2;
                pointSao[0].y = y;
                pointSao[1].x = x + 2 * (x1 - x) / 3;
                pointSao[1].y = y + (y1 - y) / 3;
                pointSao[2].x = x1;
                pointSao[2].y = (y + y1) / 2;
                pointSao[3].x = x + 2 * (x1 - x) / 3;
                pointSao[3].y = y + 2 * (y1 - y) / 3;
                pointSao[4].x = (x1 + x) / 2;
                pointSao[4].y = y1;
                pointSao[5].x = x + (x1 - x) / 3;
                pointSao[5].y = y + 2 * (y1 - y) / 3;
                pointSao[6].x = x;
                pointSao[6].y = (y + y1) / 2;
                pointSao[7].x = x + (x1 - x) / 3;
                pointSao[7].y = y + (y1 - y) / 3;

                Polygon(hdc, pointSao, 8);
            }
            
            ReleaseDC(hWnd, hdc);
            break;

        case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case ID_HinhChuNhat:
                hinh = 1;
                break;
            case ID_Elip:
                hinh = 2;
                break;
            case ID_Sao:
                hinh = 3;
                break;
            case ID_XanhLaCay:
                mau = 1;
                break;
            case ID_XanhBlue:
                mau = 2;
                break;
            case ID_Do:
                mau = 3;
                break;
            case ID_XanhNgoc:
                mau = 4;
                break;
            case ID_Thoat:
                if (MessageBox(hWnd, TEXT("Ban co muon thoat?"), TEXT("Hoi"), MB_ICONQUESTION | MB_YESNO) == IDYES)
                    DestroyWindow(hWnd);
            case IDM_ABOUT:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;
        case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hWnd, &ps);
            // TODO: Add any drawing code that uses hdc here...
            EndPaint(hWnd, &ps);
        }
        break;
        case WM_DESTROY:
            PostQuitMessage(0);
            break;
        default:
            return DefWindowProc(hWnd, message, wParam, lParam);
        }
        return 0;
    
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
