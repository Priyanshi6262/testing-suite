import { useState } from "react";

export default function Input({ placeholder }) {
  const [value, setValue] = useState("");

  return (
    <input
      placeholder={placeholder}
      value={value}
      onChange={(e) => setValue(e.target.value)}
    />
  );
}