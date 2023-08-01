import Link from "next/link";
import { Fragment, useEffect, useState, useRef } from "react";
import { sidebarOnclick, stickyNav } from "../src/utils"
import { Blog, Courses, Home, Pages } from "../src/layout/Menu"
import { useRouter } from 'next/router'
import { get, post } from '../src/services/api'
import MobileHeader from "../src/layout/MobileHeader";
import { AdministracionMenu, AprendeMenu, FinancieroMenu, MembresiaMenu } from "./layout/MenuCCGs";
import Image from "next/image";
import { Box } from "@mui/material";

const MenuMultiSuite = ({ header }) => {
  const [usuario, setUsuario] = useState(null);
  useEffect(() => {
    stickyNav();
    const usuario = localStorage.getItem('user');
    if (usuario) {
      setUsuario(JSON.parse(usuario));
    }

  }, []);
  const [navToggle, setNavToggle] = useState(false);
  switch (header) {
    case 1:
      return <Header1 navToggle={navToggle} setNavToggle={setNavToggle} usuario={usuario} />;
    case 3:
      return <Header3 navToggle={navToggle} setNavToggle={setNavToggle} />;
    case 4:
      return <Header4 navToggle={navToggle} setNavToggle={setNavToggle} />;

    default:
      return (
        <DefaultHeader navToggle={navToggle} setNavToggle={setNavToggle} />
      );
  }
};
export default MenuMultiSuite;
const Header1 = ({ navToggle, setNavToggle, usuario }) => {
  const [open, setOpen] = useState(false);
  const [menu, setMenu] = useState([]);
  const [openMenu, setOpenMenu] = useState(false);
  const [currentOption, setCurrentOption] = useState(null);
  const [currentModule, setCurrentModule] = useState(null);
  const [loading, setLoading] = useState(false);
  const [optionsModule, setOptionsModule] = useState([])
  const router = useRouter()
  const dropdownRef = useRef(null);

  const toggleDropdown = () => {
    setOpenMenu(!openMenu);
  };

  const handleClickOutside = (event) => {
    if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
      setOpenMenu(false);
    }
  };
  const mouseEnter = () => {
    setOpenMenu(true);
  }
  const mouseLeave = () => {
    setOpenMenu(false);
  }

  useEffect(() => {

    const menuTemp = localStorage.getItem('menu');
    const cOption = localStorage.getItem('currentOption');
    setCurrentOption(cOption);
    setCurrentModule(localStorage.getItem('currentModule'))
    if (menuTemp) {
      setMenu(JSON.parse(menuTemp));


    }
    document.addEventListener('click', handleClickOutside);
    return () => {
      document.removeEventListener('click', handleClickOutside);
    };
  }, [])

  const changeModule = async (module, codigo) => {
    //check if the module is the same
    if (module === currentModule) {
      return;
    }
    const moduleDescripcion = module;
    setCurrentModule(moduleDescripcion);
    localStorage.setItem('currentModule', moduleDescripcion);
    localStorage.setItem('currentModuleID', codigo);

    const menuTemp = await get(`/menu/get_opciones_modulo/${codigo}`);
    if (menuTemp) {
      setLoading(true);
      localStorage.setItem('optionsModule', JSON.stringify(menuTemp['opciones']));
      await new Promise((resolve) => setTimeout(resolve, 0)); // Wait for the localStorage changes to propagate
      window.location.reload();
      setOptionsModule(menuTemp['opciones']);
      setLoading(false);
    }
  };



  return (
    <Fragment>
      <header className="main-header align-items-center justify-content-center " >
        {/* Header-Top */}
        <HeaderTop navToggle={open} setNavToggle={setOpen} usuario={usuario} />
        {/* Header-Upper */}
        <div className="header-upper" >
          <div className="container-fluid clearfix bg-white" >
            <div className="header-inner ">

              <div className="nav-outer clearfix" style={{ padding: '0px' }}>

                {/* Main Menu */}

                <nav className="main-menu navbar-expand-lg"
                  style={{ padding: '0px' }}
                >

                  <div className="navbar-header">
                    <div className="mobile-logo br-10 p-15" >
                      <Link href="/selector">
                        <a>
                          <Image
                            src="/assets/images/logos/logoCCGBlack.png"
                            alt="Logo"
                            title="Logo"
                            layout="fill"
                            style={{ maxHeight: "50px" }} />
                        </a>
                      </Link>
                    </div>
                    {/* Toggle Button */}
                    <button
                      type="button"
                      className="navbar-toggle"
                      data-toggle="collapse"
                      data-target=".navbar-collapse"
                      onClick={() => setNavToggle(!navToggle)}
                    >
                      <span className="icon-bar" style={{ background: "#1DA1F2" }} />
                      <span className="icon-bar" style={{ background: "#1DA1F2" }} />
                      <span className="icon-bar" style={{ background: "#1DA1F2" }} />
                    </button>
                  </div>
                  <div
                    className={`navbar-collapse collapse clearfix ${navToggle ? "show" : ""
                      }`}
                    style={{ display: "flex", justifyContent: "space-between" }}

                  >
                    <div
                      style={{ display: "flex", justifyContent: "flex-start", alignItems: "center" }}
                    >
                      <div className={`dropdown ${openMenu ? 'show' : ''}`}
                        ref={dropdownRef}
                      >
                        <i
                          className="fas fa-th d-none d-lg-block"
                          style={{ fontSize: "20px", cursor: "pointer", color: "#1DA1F2" }}
                          onClick={toggleDropdown}
                          onTouchMove={toggleDropdown}
                          onMouseEnter={mouseEnter}
                        ></i>
                        <div className={`dropdown-menu ${openMenu ? 'show' : ''}`}>
                          <div className="input-group input-group-sm" style={{ width: '200px', padding: '3px' }}>
                            <input type="text" className="form-control" placeholder="Buscar..." />
                            <div className="input-group-append">
                              <button className="btn btn-outline-secondary" type="button">
                                <i className="fas fa-search"></i>
                              </button>
                            </div>
                          </div>
                          <span
                            className="dropdown-content"

                          ><strong> Aplicaciones</strong></span>
                          {menu.length > 0 && menu.map((item, index) => (
                            <Link href={'/' + item.descripcion} key={index}>
                              <a onClick={() => changeModule(item.descripcion, item.codigo)} className="dropdown-item" key={index}>
                                {item.descripcion}
                              </a>
                            </Link>
                          ))}
                        </div>
                      </div>
                      <div
                        style={{
                          color: "black",
                          fontSize: "large",
                          padding
                            : "10px 0px 10px 10px",
                          left: "0px",

                        }}
                        className="d-none d-lg-block">
                        <strong>{currentModule}</strong>

                      </div>
                    </div>


                    <Menus
                      options={optionsModule}
                    />
                    {/*<MobileHeader />*/}

                  </div>
                </nav>
                {/* Main Menu End*/}
              </div>
              {/* Menu Button */}
              <div className="menu-btn-sidebar d-flex align-items-center" >
                <div className="menu-sidebar" onClick={() => sidebarOnclick()} style={{ display: "none" }}>
                  <button>
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/*End Header Upper*/}
      </header>
    </Fragment>
  )
},
  Header3 = ({ navToggle, setNavToggle }) => (
    <Fragment>
      <header className="main-header header-three">
        {/* Header-Top */}
        <HeaderTop />
        {/* Header-Upper */}
        <div className="header-upper">
          <div className="container clearfix">
            <div className="header-inner d-flex align-items-center justify-content-between">
              <div className="logo-outer d-lg-flex align-items-center">
                <div className="logo" >
                  <Link href="/">
                    <a>
                      <Image
                        src="assets/images/logos/logo-two.png"
                        alt="Logo"
                        title="Logo"
                      />
                    </a>
                  </Link>
                </div>
              </div>
              <div className="nav-outer clearfix">
                {/* Main Menu */}
                <nav className="main-menu navbar-expand-lg">
                  <div className="navbar-header">
                    <div className="mobile-logo">
                      <Link href="/">
                        <a>
                          <Image
                            src="assets/images/logos/logo-two.png"
                            alt="Logo"
                            title="Logo"
                          />
                        </a>
                      </Link>
                    </div>
                    {/* Toggle Button */}
                    <button
                      type="button"
                      className="navbar-toggle"
                      data-toggle="collapse"
                      data-target=".navbar-collapse"
                    >
                      <span className="icon-bar" />
                      <span className="icon-bar" />
                      <span className="icon-bar" />
                    </button>
                  </div>
                  <div
                    className={`navbar-collapse collapse clearfix ${navToggle ? "show" : ""
                      }`}
                  >
                    <Menus />
                    <MobileHeader />
                  </div>
                </nav>
                {/* Main Menu End*/}
              </div>
              {/* Menu Button */}
              <div className="menu-btn-sidebar d-flex align-items-center">
                <div className="nav-search">
                  <button className="fa fa-search" />
                  <form
                    onSubmit={(e) => e.preventDefault()}
                    action="#"
                    className="hide"
                  >
                    <input
                      type="text"
                      placeholder="Search"
                      className="searchbox"
                      required=""
                    />
                    <button
                      type="submit"
                      className="searchbutton fa fa-search"
                    />
                  </form>
                </div>
                <button className="cart">
                  <i className="fas fa-shopping-bag" />
                </button>
                <button>
                  <i className="far fa-user-circle" />
                </button>
                {/* menu sidbar */}
                <div className="menu-sidebar" onClick={() => sidebarOnclick()}>
                  <button>
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        {/*End Header Upper*/}
      </header>
    </Fragment>
  ),
  Header4 = ({ navToggle, setNavToggle }) => (
    <header className="main-header header-four">
      {/* Header-Top */}
      <div className="header-top bg-light-blue text-white">
        <div className="container-fluid">
          <div className="top-inner">
            <div className="top-left">
              <p>
                <i className="far fa-clock" /> <b>Working Hours</b> : Manday -
                Friday, 08am - 05pm
              </p>
              <p>
                <i className="fas fa-phone" /> <b>Hotline</b> :{" "}
                <a href="callto:+012(345)6789">+012 (345) 67 89</a>
              </p>
            </div>
            <div className="top-right d-flex align-items-center">
              <div className="social-style-two">
                <Link href="/contact">
                  <i className="fab fa-twitter" />
                </Link>
                <Link href="/contact">
                  <i className="fab fa-facebook-f" />
                </Link>
                <Link href="/contact">
                  <i className="fab fa-instagram" />
                </Link>
                <Link href="/contact">
                  <i className="fab fa-pinterest-p" />
                </Link>
              </div>
              <ul className="top-menu">
                <li>
                  <Link href="/about">Setting &amp; Privacy</Link>
                </li>
                <li>
                  <Link href="/faqs">Faqs</Link>
                </li>
                <li>
                  <Link href="/about">About</Link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      {/* Header-Upper */}
      <div className="header-upper">
        <div className="container-fluid clearfix" style={{ backgroundColor: "black" }}>
          <div className="header-inner d-flex align-items-center justify-content-between">
            <div className="logo-outer">
              <div className="logo" style={{ backgroundColor: "#1DA1F2" }}>
                <Link href="/">
                  <a>
                    <Image
                      src="assets/images/logos/logo-three.png"
                      alt="Logo"
                      title="Logo"
                    />
                  </a>
                </Link>
              </div>
            </div>
            <div className="nav-outer clearfix">
              {/* Main Menu */}
              <nav className="main-menu navbar-expand-lg">
                <div className="navbar-header">
                  <div className="mobile-logo">
                    <Link href="/">
                      <a>
                        <Image
                          src="assets/images/logos/logo-three.png"
                          alt="Logo"
                          title="Logo"
                        />
                      </a>
                    </Link>
                  </div>
                  {/* Toggle Button */}
                  <button
                    type="button"
                    className="navbar-toggle"
                    data-toggle="collapse"
                    data-target=".navbar-collapse"
                    onClick={() => setNavToggle(!navToggle)}
                  >
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                  </button>
                </div>
                <div
                  className={`navbar-collapse collapse clearfix ${navToggle ? "show" : ""
                    }`}
                >
                  <Menus />
                  <MobileHeader />
                </div>
              </nav>
              {/* Main Menu End*/}
            </div>
            {/* Menu Button */}
            <div className="menu-btns d-lg-flex d-none align-items-center">
              <div className="nice-select">
                <span className="">English</span>
                <ul className="list">
                  <li data-value="English" className="option selected focus">
                    English
                  </li>
                  <li data-value="Chinese" className="option">
                    Bangla
                  </li>
                  <li data-value="Arabic" className="option">
                    Arabic
                  </li>
                </ul>
              </div>

              <Link href="/contact">
                <a className="theme-btn">
                  Register <i className="fas fa-arrow-right" />
                </a>
              </Link>
            </div>
          </div>
        </div>
      </div>
      {/*End Header Upper*/}
    </header>
  ),
  DefaultHeader = ({ navToggle, setNavToggle }) => (
    <Fragment>
      <header className="main-header header-two">
        {/* Header-Top */}
        <HeaderTop />
        {/* Header-Upper */}
        <div className="header-upper">
          <div className="container-fluid clearfix" style={{ backgroundColor: "black" }}>
            <div className="header-inner d-flex align-items-center justify-content-between">
              <div className="logo-outer d-lg-flex align-items-center">
                <div className="logo" style={{ backgroundColor: "#1DA1F2" }}>
                  <Link href="/">
                    <a>
                      <Image
                        src="assets/images/logos/logo.png"
                        alt="Logo"
                        title="Logo"
                      />
                    </a>
                  </Link>
                </div>
                <select name="select-languages" id="select-languages">
                  <option value="English">Eng</option>
                  <option value="Spanish">Spa</option>
                  <option value="Chinese">Chi</option>
                  <option value="Arabic">Ara</option>
                </select>
              </div>
              <div className="nav-outer clearfix">
                {/* Main Menu */}
                <nav className="main-menu navbar-expand-lg">
                  <div className="navbar-header">
                    <div className="mobile-logo bg-green br-10 p-15" style={{ backgroundColor: "#1DA1F2" }}>
                      <Link href="/">
                        <a>
                          <Image
                            src="assets/images/logos/logo.png"
                            alt="Logo"
                            title="Logo"
                          />
                        </a>
                      </Link>
                    </div>
                    {/* Toggle Button */}
                    <button
                      type="button"
                      className="navbar-toggle"
                      data-toggle="collapse"
                      data-target=".navbar-collapse"
                      onClick={() => setNavToggle(!navToggle)}
                    >
                      <span className="icon-bar" />
                      <span className="icon-bar" />
                      <span className="icon-bar" />
                    </button>
                  </div>
                  <div
                    className={`navbar-collapse collapse clearfix ${navToggle ? "show" : ""
                      }`}
                  >
                    <Menus />
                    <MobileHeader />
                  </div>
                </nav>
                {/* Main Menu End*/}
              </div>
              {/* Menu Button */}
              <div className="menu-btn-sidebar d-flex align-items-center">
                <form onSubmit={(e) => e.preventDefault()} action="#">
                  <input type="search" placeholder="Search" required="" />
                  <button>
                    <i className="fas fa-search" />
                  </button>
                </form>
                <button className="cart">
                  <i className="fas fa-shopping-bag" />
                </button>
                <button>
                  <i className="far fa-user-circle" />
                </button>
                {/* menu sidbar */}
                <div className="menu-sidebar" onClick={() => sidebarOnclick()}>
                  <button>
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                    <span className="icon-bar" />
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/*End Header Upper*/}
      </header>
    </Fragment>
  ),
  Menus = ({ options }) => {
    const [menuOpciones, setMenuOpciones] = useState([]);
    const [currentModule, setCurrentModule] = useState("");
    const [currentOption, setCurrentOption] = useState("");
    const router = useRouter();
  
    useEffect(() => {
      const currentModule = router.pathname.split("/")[1];
      const currentOption = router.pathname.split("/")[2];
      setCurrentModule(currentModule);
      setCurrentOption(currentOption);
    
      const menuTemp = localStorage.getItem("optionsModule");
    
      const retrieveData = async () => {
        if (currentModule && menuTemp) {
          setCurrentModule(currentModule);
          setMenuOpciones(JSON.parse(menuTemp));
        }
      };
    
      retrieveData();
    }, []);
  
    const handleOptionChange = (option) => {
      setCurrentOption(option);
      localStorage.setItem("currentOption", option);
      if (option === 'Inicio') {
        router.push(`/${currentModule}`);
      } else {
        router.push(`/${currentModule}/${option.toLowerCase()}`);
      }
    };
  
    return (
      <ul className="navigation clearfix d-none d-lg-flex">
        <li>
          <Link href={`/${currentModule}`}>
            <a
              onClick={(e) => {
                e.preventDefault();
                handleOptionChange('Inicio');
              }}
              onMouseEnter={e => e.target.style.color = 'blue'}
              onMouseLeave={e => e.target.style.color = 'black'}
              style={{
                fontWeight: "normal",
              }}
            >
              Inicio
            </a>
          </Link>
        </li>
        {menuOpciones.length > 0 &&
          menuOpciones.map((item, index) => (
            <li key={index}>
              <Link href={`/${currentModule}/${item.descripcion.toLowerCase()}`}>
                <a
                  onClick={(e) => {
                    e.preventDefault();
                    handleOptionChange(item.descripcion);
                  }}
                  onMouseEnter={e => e.target.style.color = 'blue'}
                  onMouseLeave={e => e.target.style.color = 'black'}
                  style={{
                    fontWeight: "normal",
                  }}
                >
                  {item.descripcion}
                </a>
              </Link>
            </li>
          ))
        }
      </ul>
    );
  },
  HeaderTop = ({ navToggle, setNavToggle, usuario }) => {
    const [isDropdownOpen, setIsDropdownOpen] = useState(false);

    const toggleDropdown = () => {
      setIsDropdownOpen(!isDropdownOpen);
    };

    const handleOptionClick = (option) => {
      // Handle click logic for each option
      // You can implement specific actions for each option, such as signing out or changing the mode.
    };

    return (
      <div className="header-top bg-white text-black ">
        <div className="">
          <div className="top-inner">
            <div className="">
              <div className="logo-outer " style={{ backgroundColor: "transparent" }}>
                <div className="logo" style={{ backgroundColor: "transparent" }}>
                  <Link href="/">
                    <Image src="/assets/images/logos/logoCCGBlack.png" layout="fill" />


                  </Link>
                </div>
              </div>

            </div>
            <div className=" d-none d-lg-block">
              <div className="input-group input-group-sm" style={{ width: '350px' }}>
                <div className="input-group-prepend">
                  <span className="input-group-text">
                    <i className="fas fa-search" style={{ color: "grey" }}></i>
                  </span>
                </div>
                <input type="text" className="form-control" placeholder="Buscar..." />
              </div>
            </div>
            {usuario && <div className="top-right">
              <i className="fas fa-cog" style={{ fontSize: '1.5em', color: '#1DA1F2' }} />
              <i className="fas fa-bell" style={{ fontSize: '1.5em', color: '#1DA1F2' }} />
              <div className="dropdown">
                <i className="fas fa-user" style={{ fontSize: '1.5em', color: '#1DA1F2' }} />
                <span
                  style={{ color: '#1DA1F2', fontWeight: 'bold' }}
                > {usuario.Codigo} </span>
                <button
                  onClick={toggleDropdown}
                  style={{ backgroundColor: 'transparent', border: 'none' }}
                >
                  <span className={`fas fa-chevron-${isDropdownOpen ? 'up' : 'down'}`} style={{ color: '#1DA1F2' }} />
                </button>

                {isDropdownOpen && (
                  <div className="dropdown-popup">
                    <div className="dropdown-content">
                      <div className="dropdown-item" onClick={() => handleOptionClick('option 1')}>
                        <Link href="/perfil">
                          <a>Perfil</a>
                        </Link>
                      </div>
                      <div className="dropdown-item" onClick={() => handleOptionClick('option 2')}>
                        <Link href="/logout">
                          <a>Log Out</a>
                        </Link>
                      </div>
                    </div>
                  </div>
                )}
              </div>

            </div>}


          </div>
        </div>
      </div>
    );
  };