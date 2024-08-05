// Buoi2.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "Buoi2.h"

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


HPEN hPen;
HBRUSH hBrush;

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
    LoadStringW(hInstance, IDC_BUOI2, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_BUOI2));

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
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_BUOI2));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_BUOI2);
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
   static POINT point[3] = { {200,600}, {500,300}, {700,500} };
    static POINT point1[4] = { {200,200},{600,200},{600,400},{200,400} };
    static POINT point2[4] = { {400,200},{600,400},{400,600},{200,400} };
    static POINT point3[8] = { {150,150},{200,50},{250,150},{350,200},{250,250},{200,350},{150,250},{50,200} };
    static POINT point4[4];
    static POINT pointTamGiac[3];
    static POINT pointSao[8];
    static int x, y, x1, y1;
    static HDC hdc;




    switch (message)
    {
    case WM_LBUTTONDOWN:
        x = LOWORD(lParam);
        y = HIWORD(lParam);
        break;
    case WM_LBUTTONUP:
        x1 = LOWORD(lParam);
        y1 = HIWORD(lParam);

        hPen = CreatePen(PS_DASH, 1, RGB(266,111,202)); // tao but ve 
       // hBrush = CreateSolidBrush(RGB(255,255,0));
          hBrush = CreateHatchBrush(HS_CROSS, RGB(255, 255, 0));

        hdc = GetDC(hWnd);
     //   Rectangle(hdc, x, y, x1, y1);
        SelectObject(hdc, hPen);
        SelectObject(hdc, hBrush);
        // hinh thoi
        point4[0].x = (x + x1) / 2;
        point4[0].y = y;
        point4[1].x = x1;
        point4[1].y = (y + y1) / 2;
        point4[2].x = (x + x1) / 2;
        point4[2].y = y1;
        point4[3].x = x;
        point4[3].y = (y + y1) / 2;
      //  Polygon(hdc, point4, 4);

        //tam giac can
        pointTamGiac[0].x = (x + x1) / 2;
        pointTamGiac[0].y = y;
        pointTamGiac[1].x = x1;
        pointTamGiac[1].y = y1;
        pointTamGiac[2].x = x;
        pointTamGiac[2].y = y1;

      // Polygon(hdc, pointTamGiac, 3);

        // sao 4 canh
        pointSao[0].x = x+(x1 -x) / 2;
        pointSao[0].y = y;
        pointSao[1].x = x + 2 * (x1 - x) / 3;
        pointSao[1].y = y+(y1 - y) / 3;
        pointSao[2].x = x1;
        pointSao[2].y = (y + y1) / 2;
        pointSao[3].x = x+ 2 * (x1 - x) / 3;
        pointSao[3].y = y+ 2*(y1 - y) / 3;
        pointSao[4].x = (x1 + x) / 2;
        pointSao[4].y = y1;
        pointSao[5].x = x+ (x1 - x) / 3;
        pointSao[5].y = y+ 2* (y1 - y) / 3;
        pointSao[6].x = x;
        pointSao[6].y = (y + y1) / 2;
        pointSao[7].x = x+ (x1 - x) / 3;
        pointSao[7].y = y+ (y1 - y) / 3;

        Polygon(hdc, pointSao, 8);

       

        ReleaseDC(hWnd, hdc);
        break;
    case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
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
            // 
            // 
            // ve doan thang bang setpixel
          //  for(int i=200;i<=600;i++)
          //      SetPixel(hdc, i, 200, RGB(255, 0, 0));

          //  // ve doan thang bang ham
          //  MoveToEx(hdc, 200, 400, NULL);
          //  LineTo(hdc, 600, 400);


          //  // ve duong gap khuc
          ////  Polyline(hdc, point, 3);

          //  // ve da giac
          //  Polygon(hdc, point, 3);

            // hinh chu nhat 
      
           // Polygon(hdc, point1, 4);
            //Rectangle(hdc, 100, 300, 300, 200);
            RoundRect(hdc, 100, 300, 300, 200, 50, 50); // hcn bo goc

            //hinh thoi
         //   Polygon(hdc, point2, 4);

            //hinh sao 4 canh
           // Polygon(hdc, point3, 8);

            // hinh ellipise
            Ellipse(hdc, 100, 100, 500, 200);

            // hinh cung
           // Arc(hdc, 250, 250, 600, 450, 300, 250, 250, 400);

            // hinh quat
            Pie(hdc, 250, 250, 600, 450, 300, 250, 250, 400);

            // hinh chop
            Chord(hdc, 250, 250, 600, 450, 300, 250, 250, 400);

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

// hinh thoi, sao 4 canh, hcn, 