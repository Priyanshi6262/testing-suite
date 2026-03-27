import Button from "./components/Button";
import Card from "./components/Card";
import Input from "./components/Input";
import Counter from "./components/Counter";

export default function App() {
  return (
    <div>
      <h1>Testing Suite</h1>

      <Button text="Click Me" />
      <Card title="Hello" description="World" />
      <Input placeholder="Type here..." />
      <Counter />
    </div>
  );
}