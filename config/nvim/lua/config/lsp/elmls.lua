return {
  cmd = { "elm-language-server" },
  filetypes = { "elm" },
  init_options = {
    elmAnalyseTrigger = "change",
    elmFormatPath = "elm-format",
    elmPath = "elm",
    elmTestPath = "elm-test",
  },
  settings = {
    elmReviewDiagnostics = "warning",
    disableElmLSDiagnostics = false,
    -- elmFormatPath = "",
    elmTestRunner = {
      showElmTestOutput = true,
    },
    onlyUpdateDiagnosticsOnSave = true,
    skipInstallPackageConfirmation = false,
  },
}
