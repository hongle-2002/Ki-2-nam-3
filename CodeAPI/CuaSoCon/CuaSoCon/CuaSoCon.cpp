// CuaSoCon.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "CuaSoCon.h"

#define MAX_LOADSTRING 100

#define ID_EDIT 1
#define ID_BUTTON 2
#define ID_LISTBOX 3
#define ID_BUTTON2 4
#define ID_LISTBOX2 5
#define ID_TEXTBOX 6
#define ID_TEXTBOX2 7


HWND hWndEdit, hWndButton,hWndListBox, hWndListBox2,hWndButton2,hWndTextBox, hWndTextbox2;
// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

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
    LoadStringW(hInstance, IDC_CUASOCON, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_CUASOCON));

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

    wcex.style          = CS_HREDRAW | CS_VREDRAW| CS_DBLCLKS;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_CUASOCON));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_CUASOCON);
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

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

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
    static int vitri;
    static TCHAR hoTen[30];
    static int l;
    
    switch (message)
    {
    case WM_CREATE:
        hWndEdit = CreateWindow(TEXT("edit"),TEXT(""),WS_CHILD|WS_VISIBLE|WS_BORDER,
                50,50,100,30,hWnd,(HMENU)ID_EDIT,NULL,NULL);
        hWndButton = CreateWindow(TEXT("button"), TEXT("Them vao thuc don"), WS_CHILD|WS_VISIBLE|WS_BORDER,
                230, 50, 200, 50, hWnd, (HMENU)ID_BUTTON, NULL, NULL);
        hWndListBox = CreateWindow(TEXT("listbox"), TEXT(""), WS_CHILD | WS_BORDER | LBS_NOTIFY | WS_VISIBLE,
            50, 200, 200, 300, hWnd, (HMENU)ID_LISTBOX, NULL, NULL);
        hWndButton2 = CreateWindow(TEXT("button"), TEXT("LAM LAI"), WS_CHILD | WS_VISIBLE | WS_BORDER,
            270, 250, 100, 50, hWnd, (HMENU)ID_BUTTON2, NULL, NULL);
        hWndListBox2 = CreateWindow(TEXT("listbox"), TEXT(""), WS_CHILD | WS_BORDER | LBS_NOTIFY | WS_VISIBLE,
            400, 200, 200, 300, hWnd, (HMENU)ID_LISTBOX2, NULL, NULL);
        break;

    case WM_COMMAND:
        {
            

            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case ID_BUTTON:
                // gan du lieu vao bien
              l=   GetWindowText(hWndEdit, hoTen, 30);
                    if (l == 0) {
                         MessageBox(NULL, TEXT("chua nhap"), TEXT("Thong Bao"), MB_ICONINFORMATION | MB_OK);
                         SetFocus(hWndEdit);

                    }  
                    else
               
                    {
                        MessageBox(NULL, hoTen, TEXT("Thong Bao"), MB_ICONINFORMATION | MB_OK);
                        SendMessage(hWndListBox, LB_ADDSTRING, -1, (LPARAM)hoTen);
                    }

                    break;

            case ID_LISTBOX:
                switch (HIWORD(wParam))
                {
                case LBN_DBLCLK:
                    // lay vi tri dang click dup chuot trong listbox
                    vitri = SendMessage(hWndListBox, LB_GETCURSEL, 0, 0);
                    SendMessage(hWndListBox, LB_GETTEXT, vitri, (LPARAM)hoTen);
                    // add bien hoten vao listbox2
                    SendMessage(hWndListBox2, LB_ADDSTRING, -1, (LPARAM)hoTen);
                default:
                    break;
                }
                break;
            case ID_LISTBOX2:
                switch (HIWORD(wParam))
                {
                case LBN_DBLCLK:
                    if (MessageBox(hWnd, TEXT("Ban co muon xoa khong?"), TEXT("Hoi"), MB_ICONQUESTION | MB_YESNO) == IDYES)
                    {
                        vitri = SendMessage(hWndListBox, LB_GETCURSEL, 0, 0);

                        SendMessage(hWndListBox2, LB_DELETESTRING, vitri, (LPARAM)hoTen);
                    }
                   
                    break;
                default:
                    break;
                }
                break;
            case ID_BUTTON2:
                SendMessage(hWndListBox2, LB_RESETCONTENT, 0, 0);
                break;
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
