{

  # note: Ollama always calls Nvidia GPU using CUDA to can't to D3Cold if nixpkgs.config.cudaSupport is enabled
  services.ollama.enable = true;
  # services.nextjs-ollama-llm-ui.enable = true;
}
