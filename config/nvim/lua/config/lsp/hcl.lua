return {
  name = "terraform-ls",
  cmd = { "terraform-ls", "serve" },
  root_dir = { ".terraform" },
  init_options = {
    ignoreSinglefileWarning = true,
    experimentalFeatures = {
      validateOnSave = true,
      prefillRequiredFields = true,
    },
  },
}
