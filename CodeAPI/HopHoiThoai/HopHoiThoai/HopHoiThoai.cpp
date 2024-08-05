// HopHoiThoai.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "HopHoiThoai.h"

#define MAX_LOADSTRING 100

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
    LoadStringW(hInstance, IDC_HOPHOITHOAI, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_HOPHOITHOAI));

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
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_HOPHOITHOAI));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDR_MENU1);
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
    switch (message)
    {
    case WM_COMMAND:
        {
       
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case ID_THAOTAC_DANGKIHOC:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_DIALOG1), hWnd, About);
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
    static int viTri = -1;
    static  int c1 = 0, c2 = 0, c3 = 0;
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDC_LIST1)
        {
            switch (HIWORD(wParam))
            {
            case LBN_DBLCLK:
               
                if (SendMessage(GetDlgItem(hDlg, IDC_TinHocDaiCuong), BM_GETCHECK, 0, 0) == true)
                {
                    c1 = 1;

                }
                if (SendMessage(GetDlgItem(hDlg, IDC_KyThuatXD), BM_GETCHECK, 0, 0) == true)
                {
                    c2 = 1;

                }
                if (SendMessage(GetDlgItem(hDlg, IDC_XDCongTrinh), BM_GETCHECK, 0, 0) == true)
                {
                    c3 = 1;
                }
                // neu checkbox 1 va 2 duoc chon
                if (c1 == 1 && c2 == 1)
                {
                    // lay ra vi tri dc kich dup
                    viTri = SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_GETCURSEL, 0, 0);
                    // xoa phan tu o vi tri do
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_DELETESTRING, viTri, 0);
                    TCHAR s[30];
                    // chen mon hoc con lai vao , chinh laf checkbox thu 3
                    GetWindowText(GetDlgItem(hDlg, IDC_XDCongTrinh), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
                // neu checkbox 1 va 3 duoc chon
                if (c1 == 1 && c3 == 1)
                {
                    // lay ra vi tri dc kich dup
                    viTri = SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_GETCURSEL, 0, 0);
                    // xoa phan tu o vi tri do
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_DELETESTRING, viTri, 0);
                    TCHAR s[30];
                    // chen mon hoc con lai vao , chinh laf checkbox thu 2
                    GetWindowText(GetDlgItem(hDlg, IDC_KyThuatXD), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
                // neu checkbox 2 va 3 duoc chon
                if (c3 == 1 && c2 == 1)
                {
                    // lay ra vi tri dc kich dup
                    viTri = SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_GETCURSEL, 0, 0);
                    // xoa phan tu o vi tri do
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_DELETESTRING, viTri, 0);
                    TCHAR s[30];
                    // chen mon hoc con lai vao , chinh laf checkbox thu 3
                    GetWindowText(GetDlgItem(hDlg, IDC_TinHocDaiCuong), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
            default:
                break;
            }
        }

        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        if (LOWORD(wParam) == IDC_LamLai) {
            SendMessage(GetDlgItem(hDlg, IDC_TinHocDaiCuong), BM_SETCHECK, 0, 0);
            SendMessage(GetDlgItem(hDlg, IDC_KyThuatXD), BM_SETCHECK, 0, 0);
            SendMessage(GetDlgItem(hDlg, IDC_XDCongTrinh), BM_SETCHECK, 0, 0);
            SendMessage(GetDlgItem(hDlg, IDC_CongTrinhTP), BM_SETCHECK, 0, 0);
            SendMessage(GetDlgItem(hDlg, IDC_CongTrinhDT), BM_SETCHECK, 0, 0);
            SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_RESETCONTENT, 0, 0);
        }

        if (LOWORD(wParam) == IDC_ChapNhap) {
            int dem = 0, dem1 = 0;
            if (SendMessage(GetDlgItem(hDlg, IDC_TinHocDaiCuong), BM_GETCHECK, 0, 0) == true)
            {
                dem++;
               
            }
            if (SendMessage(GetDlgItem(hDlg, IDC_KyThuatXD), BM_GETCHECK, 0, 0) == true)
            {
                dem++;
                
            }
            if (SendMessage(GetDlgItem(hDlg, IDC_XDCongTrinh), BM_GETCHECK, 0, 0) == true)
            {
                dem++;
            }
            if (dem >= 2)
            {
                if (SendMessage(GetDlgItem(hDlg, IDC_TinHocDaiCuong), BM_GETCHECK, 0, 0) == true)
                {
                    TCHAR s[30];
                    GetWindowText(GetDlgItem(hDlg, IDC_TinHocDaiCuong), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
                if (SendMessage(GetDlgItem(hDlg, IDC_KyThuatXD), BM_GETCHECK, 0, 0) == true)
                {
                    TCHAR s[30];
                    GetWindowText(GetDlgItem(hDlg, IDC_KyThuatXD), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
                if (SendMessage(GetDlgItem(hDlg, IDC_XDCongTrinh), BM_GETCHECK, 0, 0) == true)
                {
                    TCHAR s[30];
                    GetWindowText(GetDlgItem(hDlg, IDC_XDCongTrinh), s, 30);
                    SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                }
            }
            else {
                MessageBox(NULL, TEXT("Ban phai chon it nhat 2 mon bat buoc"), TEXT("Thong bao"), MB_ICONINFORMATION);
            }
            if (dem >= 1)
            {
                if (SendMessage(GetDlgItem(hDlg, IDC_CongTrinhTP), BM_GETCHECK, 0, 0) == true)
                    {
                          
                        dem1++;
                        TCHAR s[30];
                        GetWindowText(GetDlgItem(hDlg, IDC_CongTrinhTP), s, 30);
                        SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                    }
                if (SendMessage(GetDlgItem(hDlg, IDC_CongTrinhDT), BM_GETCHECK, 0, 0) == true)
                    {

                         dem1++;
                        TCHAR s[30];
                        GetWindowText(GetDlgItem(hDlg, IDC_CongTrinhDT), s, 30);
                        SendMessage(GetDlgItem(hDlg, IDC_LIST1), LB_INSERTSTRING, -1, (LPARAM)s);
                    }

            }
            else
            {
                MessageBox(NULL, TEXT("Ban phai chon it nhat 1 mon bat buoc, moi chon duoc mon tu chon"), TEXT("Thong bao"), MB_ICONINFORMATION);
            }
           
            if (SendMessage(GetDlgItem(hDlg, IDC_CongTrinhTP), BM_GETCHECK, 0, 0) == false && SendMessage(GetDlgItem(hDlg, IDC_CongTrinhDT), BM_GETCHECK, 0, 0) == false)
            {
                MessageBox(hDlg, TEXT("Phải chọn 1 môn tự chọn"), TEXT("Thong Bao"), MB_ICONINFORMATION|MB_OK);

            }
             /*if (dem >= 2 && dem1 >= 1)
                {
                    MessageBox(NULL,TEXT("Ban da dang ki thanh cong ")+ (dem + dem1), TEXT("mon hoc"), )
                 }*/   
        }
        
        if (LOWORD(wParam) == IDC_Thoat) {
            if (MessageBox(hDlg, TEXT("Bạn có muốn thoát không?"), TEXT("TB"), MB_YESNO | MB_ICONQUESTION) == IDYES)
            DestroyWindow(hDlg);
        }
        break;
    }
    return (INT_PTR)FALSE;
}
