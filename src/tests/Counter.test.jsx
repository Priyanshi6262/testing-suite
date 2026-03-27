import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import Counter from "../components/Counter";

test("increments count on click", async () => {
  const user = userEvent.setup();
  render(<Counter />);
  
  const button = screen.getByText("Increment");
  const count = screen.getByTestId("count");

  expect(count).toHaveTextContent("0");

  await user.click(button);

  expect(count).toHaveTextContent("1");
});