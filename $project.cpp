#include <tchar.h>

#ifdef _CONSOLE
#include <cstdlib>
#include <cstdio>

int _tmain(int argc, const TCHAR* const argv[])
{
	_tprintf(_T("Hello World\n"));
	return EXIT_SUCCESS;
}
#endif

#ifdef _WINDOWS
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

int WINAPI _tWinMain(_In_ HINSTANCE hInstance, _In_opt_ HINSTANCE hPrevInstance, _In_ LPTSTR lpCmdLine, _In_ int nShowCmd)
{
	MessageBox(NULL, _T("Hello World"), _T("$project"), MB_OK | MB_ICONINFORMATION);
	return 0;
}
#endif
