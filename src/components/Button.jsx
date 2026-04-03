export default function Button({ text, variant = "primary", disabled, onClick, size = "medium", primary = false }) {
  const baseStyles = {
    padding: size === "small" ? "4px 8px" : size === "large" ? "12px 24px" : "8px 16px",
    border: "none",
    borderRadius: "4px",
    cursor: disabled ? "not-allowed" : "pointer",
    fontSize: size === "small" ? "12px" : size === "large" ? "18px" : "14px",
  };

  const styles = {
    primary: { ...baseStyles, background: primary ? "blue" : "gray", color: "white" },
    secondary: { ...baseStyles, background: "gray", color: "white" },
  };

  return (
    <button 
      style={styles[variant]} 
      disabled={disabled}
      onClick={onClick}
    >
      {text}
    </button>
  );
}