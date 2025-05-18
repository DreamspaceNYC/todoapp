import { createContext, useContext, useEffect, useState } from "react";

export const ThemeContext = createContext();

export const ThemeContextProvider = ({ children }) => {
  const theme = localStorage.getItem("chronolist_theme");
  const [isLight, setIsLight] = useState(theme === "DARK" ? false : true);

  const darkThemeMq = window.matchMedia("(prefers-color-scheme: dark)");

  useEffect(() => {
    if (darkThemeMq.matches) {
      setIsLight(false);
      localStorage.setItem("chronolist_theme", "DARK");
    } else {
      setIsLight(true);
      localStorage.setItem("chronolist_theme", "LIGHT");
    }
  }, []);

  useEffect(() => {
    localStorage.setItem("chronolist_theme", isLight ? "LIGHT" : "DARK");
  }, [isLight]);
  return <ThemeContext.Provider value={{ isLight, setIsLight }}>{children}</ThemeContext.Provider>;
};

export const useThemeContextValue = () => useContext(ThemeContext);
