import Link from "next/link";
import { useState } from "react";
import { Blog, Courses, Home, Pages } from "./Menu";
import { AdministracionMenu, AprendeMenu, FinancieroMenu, MembresiaMenu } from "./MenuCCGs";

const MobileHeader = () => {
  const [activeMenu, setActiveMenu] = useState("");
  const activeMenuSet = (value) =>
    setActiveMenu(activeMenu === value ? "" : value),
    activeLi = (value) =>
      value === activeMenu ? { display: "block" } : { display: "none" };
  return (
    <ul className="navigation clearfix d-block d-lg-none mobile-header" >
      {/* <li className="dropdown current">
        <a href="#">Iglesia</a>
        <ul style={activeLi("home")}>
          <Home />
        </ul>
        <div className="dropdown-btn" onClick={() => activeMenuSet("home")}>
          <span className="fas fa-chevron-down" />
        </div>
      </li> */}
      <li className="dropdown">
        <Link href="/Membresia">
          <a >MEMBRESÍA</a></Link>
          <ul style={activeLi("MembresiaMenu")}>
            <MembresiaMenu />
          </ul>
          <div className="dropdown-btn" onClick={() => activeMenuSet("MembresiaMenu")}>
            <span className="fas fa-chevron-down" />
          </div>
        
      </li>
      <li className="dropdown">
        <Link href="/">
          <a >APRENDE</a>
        </Link>
        <ul style={activeLi("AprendeMenu")}>
            <AprendeMenu />
          </ul>
          <div className="dropdown-btn" onClick={() => activeMenuSet("AprendeMenu")}>
            <span className="fas fa-chevron-down" />
          </div>
      </li>
      <li className="dropdown">
        <Link href="/">
          <a >FINANCIERO</a>
        </Link>
        <ul style={activeLi("FinancieroMenu")}>
            <FinancieroMenu />
          </ul>
          <div className="dropdown-btn" onClick={() => activeMenuSet("FinancieroMenu")}>
            <span className="fas fa-chevron-down" />
          </div>
      </li>
      <li className="dropdown">
        <Link href="/">
          <a >ADMINISTRACIÓN</a>
        </Link>
        <ul style={activeLi("AdministracionMenu")}>
            <AdministracionMenu />
          </ul>
          <div className="dropdown-btn" onClick={() => activeMenuSet("AdministracionMenu")}>
            <span className="fas fa-chevron-down" />
          </div>
      </li>
      <li>
        <Link href="/">
          <a >REPORTES</a>
        </Link>
      </li>
      <li >
        <Link href="/">
          <a
          >TABLEROS</a>
        </Link>
      </li>
      {/* <li className="dropdown">
        <a href="#">Grupos</a>
        <ul style={activeLi("Courses")}>
          <Courses />
        </ul>
        <div className="dropdown-btn" onClick={() => activeMenuSet("Courses")}>
          <span className="fas fa-chevron-down" />
        </div>
      </li>
      <li className="dropdown">
        <a href="#">Donar</a>
        <ul style={activeLi("Pages")}>
          <Pages />
        </ul>
        <div className="dropdown-btn" onClick={() => activeMenuSet("Pages")}>
          <span className="fas fa-chevron-down" />
        </div>
      </li> */}
      {/* <li className="dropdown">
        <a href="#">blog</a>
        <ul style={activeLi("Blog")}>
          <Blog />
        </ul>
        <div className="dropdown-btn" onClick={() => activeMenuSet("Blog")}>
          <span className="fas fa-chevron-down" />
        </div>
      </li> */}
    </ul>
  );
};
export default MobileHeader;
