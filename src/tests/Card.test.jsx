import { render, screen } from "@testing-library/react";
import Card from "../components/Card";

test("renders card correctly", () => {
  render(<Card title="Hello" description="World" />);
});

test("displays title and description", () => {
  render(<Card title="Hello" description="World" />);
  expect(screen.getByText("Hello")).toBeInTheDocument();
  expect(screen.getByText("World")).toBeInTheDocument();
});