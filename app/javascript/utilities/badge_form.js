document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector('form[data-categories][data-levels][data-prompt-text]');
  if (!form) return;

  const ruleTypeSelect = form.querySelector("#badge_rule_type");
  const ruleValueSelect = form.querySelector("#badge_rule_value");

  const categories = JSON.parse(form.dataset.categories);
  const levels = JSON.parse(form.dataset.levels);
  const promptText = form.dataset.promptText || "Select...";

  const optionsMap = {
    all_in_category: categories,
    all_of_level: levels,
    first_try: []
  };

  const buildSelect = opts => {
    ruleValueSelect.innerHTML = "";

    const promptOption = document.createElement("option");
    promptOption.text = promptText;
    promptOption.value = "";
    ruleValueSelect.appendChild(promptOption);

    opts.forEach(opt => {
      const o = document.createElement("option");
      o.value = opt.value;
      o.text = opt.text;
      ruleValueSelect.appendChild(o);
    });
  };

  ruleTypeSelect.addEventListener("change", () => {
    const selectedType = ruleTypeSelect.value;
    const opts = optionsMap[selectedType] || [];
    buildSelect(opts);
    ruleValueSelect.disabled = selectedType === "first_try";
  });

  if (ruleTypeSelect.value) {
    const opts = optionsMap[ruleTypeSelect.value] || [];
    buildSelect(opts);
    ruleValueSelect.disabled = ruleTypeSelect.value === "first_try";
  }
});
