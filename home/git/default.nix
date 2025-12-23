{...}: {
  programs.git = {
    enable = true;

    settings = {
      core = {
        pager = "delta";
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      delta = {
        navigate = true;
        light = false;
        side-by-side = true;
      };
      diff = {
        colorMoved = "default";
      };
      merge = {
        conflictstyle = "diff3";
      };
      alias = {
        dl = "-c diff.external=difft log -p --ext-diff";
        ds = "-c diff.external=difft show --ext-diff";
        dft = "-c diff.external=difft diff";
      };
    };
  };

  programs.delta = {
    enable = true;
  };

  programs.difftastic = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        pagers = {
          externalDiffCommand = "difft --color always";
        };
      };

      # gui = {
      #   showFileTree = true;
      #   showRandomTip = false;
      #   showCommandLog = false;
      #   theme = {
      #     activeBorderColor = ["cyan" "bold"];
      #     inactiveBorderColor = ["white"];
      #     selectedLineBgColor = ["blue"];
      #     selectedRangeBgColor = ["blue"];
      #   };
      # };

      refresher = {
        refreshInterval = 10;
        fetchInterval = 60;
      };
    };
  };
}
