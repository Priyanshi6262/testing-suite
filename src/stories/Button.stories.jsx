import Button from "../components/Button";

export default {
  title: "Components/Button",
  component: Button,
};

export const Primary = {
  args: {
    text: "Primary",
    variant: "primary",
  },
};

export const Secondary = {
  args: {
    text: "Secondary",
    variant: "secondary",
  },
};

export const Disabled = {
  args: {
    text: "Disabled",
    disabled: true,
  },
};