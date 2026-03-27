import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import Input from "../components/Input";

test("renders input", () => {
  render(<Input placeholder="Enter text" />);
});

test("updates value on typing", async () => {
  const user = userEvent.setup();
  render(<Input placeholder="Enter text" />);
  
  const input = screen.getByPlaceholderText("Enter text");

  await user.type(input, "Hello");

  expect(input).toHaveValue("Hello");
});