import { render, screen } from "@testing-library/react";
import Button from "../components/Button";

test("renders button without crashing", () => {
  render(<Button text="Click Me" />);
});

test("displays correct text", () => {
  render(<Button text="Click Me" />);
  expect(screen.getByText("Click Me")).toBeInTheDocument();
});

test("calls onClick handler when clicked", () => {
  const handleClick = jest.fn();
  render(<Button text="Click Me" onClick={handleClick} />);
  screen.getByText("Click Me").click();
  expect(handleClick).toHaveBeenCalledTimes(1);
});