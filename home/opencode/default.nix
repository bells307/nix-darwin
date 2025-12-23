{ ... }:

{
  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    plugin = [ "opencode-openai-codex-auth@4.1.0" ];
    provider = {
      openai = {
        options = {
          reasoningEffort = "medium";
          reasoningSummary = "auto";
          textVerbosity = "medium";
          include = [ "reasoning.encrypted_content" ];
          store = false;
        };
        models = {
          "gpt-5.2-low" = {
            name = "GPT 5.2 Low (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "low";
              reasoningSummary = "auto";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.2-medium" = {
            name = "GPT 5.2 Medium (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "medium";
              reasoningSummary = "auto";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.2-high" = {
            name = "GPT 5.2 High (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "high";
              reasoningSummary = "detailed";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.2-xhigh" = {
            name = "GPT 5.2 Extra High (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "xhigh";
              reasoningSummary = "detailed";
              textVerbosity = "high";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.1-codex-low" = {
            name = "GPT 5.1 Codex Low (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "low";
              reasoningSummary = "auto";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.1-codex-medium" = {
            name = "GPT 5.1 Codex Medium (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "medium";
              reasoningSummary = "auto";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
          "gpt-5.1-codex-high" = {
            name = "GPT 5.1 Codex High (OAuth)";
            limit = {
              context = 272000;
              output = 128000;
            };
            modalities = {
              input = [
                "text"
                "image"
              ];
              output = [ "text" ];
            };
            options = {
              reasoningEffort = "high";
              reasoningSummary = "detailed";
              textVerbosity = "medium";
              include = [ "reasoning.encrypted_content" ];
              store = false;
            };
          };
        };
      };
    };
  };
}
