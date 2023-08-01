
import React from 'react'
import Layout from '../../src/layout/Layout'
import { Container } from 'react-bootstrap'
import Link from 'next/link'
import Image from "next/image";
import Tab from '@mui/material/Tab'
import Tabs from '@mui/material/Tabs';
import Typography from '@mui/material/Typography';
import Box from '@mui/material/Box';
import { coachSlider } from '../../src/sliderProps'
import Slider from 'react-slick'

import { useTheme } from '@mui/material/styles';
import IconButton from '@mui/material/IconButton';
import Brightness4Icon from '@mui/icons-material/Brightness4';
import Brightness7Icon from '@mui/icons-material/Brightness7';
import MenuMultiSuite from '../../src/MenuMultiSuite';


const MainPage = ({colorMode}) => {
    const theme = useTheme()

    return (
        <div>
        <MenuMultiSuite header={1} />
            
            <Container>
                <section className="row pt-50 rpt-90">
                    <div className="col-lg-8">
                        <div className="blog-details-wrap">
                            <div className="image mb-25 wow fadeInUp delay-0-2s" >
                                <img src="https://s3-alpha-sig.figma.com/img/8aab/e529/270ef7047412a2d38d75cf573baed828?Expires=1685318400&Signature=XjCMiey7hVAKTLJri4iwdnkCOtYLUuqKpcUB0C8uqTHiRnawFg3JnfKA5krlnRlQP7nXNkl4B2OdFyV8DUH3YP3bZU5vSuHRKOVhAautd353ovKzldhjPc38iGdVAMdguoKX6iU3Iy3LV120QzkoJrM-1q8fNKkPgfIPCnJBoNd~gEcHf1sJ17cx5bXa10H8Hdap1DZa5vbeiflpNw-z2SYLf4ewhZe-yeYWArOWp1j95IB~0XAr8loXZW3DDD0BlCae8nl7FwJtdAwdriN0IHlDbB~BMUJOg1u6qcWX0CSmsqpm3Qy11-Be~jrS-h5xlG92NWsgHbiW-TIRVuijSA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4" alt="Blog" style={{ opacity: 0.4, filter: 'brightness(0.7)', borderRadius: 15 }} />
                                <div className="image-text" style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', textAlign: 'left' }}>
                                    <h2>Fase 3</h2>
                                    <p>2 de 7 módulos completados</p>
                                </div>
                                <a href="#" style={{ position: 'absolute', top: '10px', right: '10px' }}>
                                <i class="fa fa-play" aria-hidden="true"></i>
                                </a>
                                <div style={{ position: 'absolute', bottom: '10px', left: '50%', transform: 'translateX(-50%)' }}>
                                    <Link href="Aprende/video">
                                        <button type="submit" className="theme-btn" >
                                            Continua aprendiendo
                                        </button>
                                    </Link>

                                </div>
                            </div>

                            <ul className="blog-standard-header wow fadeInUp delay-0-2s" style={{justifyContent:"center"}}>
                                <li>
                                    <i className="far fa-calendar-alt" />{" "}
                                    <Link href="/blog-details">February 20, 2022</Link>
                                </li>
                                <li>
                                <i class="fa fa-book" aria-hidden="true"></i>{" "}
                                    <Link href="/blog-details">7 modulos</Link>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div className="col-lg-4">
                        <div className="blog-sidebar rmt-75">
                            <div className="widget widget-about wow fadeInUp delay-0-4s">
                                Parece que aún no armas tu plan de estudios
                                <div className="image">
                                    <img src="assets/images/why-choose/circle.png" alt="Author" style={{ height: 100 }} />
                                </div>
                                <p>
                                    Con un plan de estudios podrás organizar tus cursos y
                                    tener un mejor control de tu aprendizaje
                                </p>
                                <div className="social-style-two">
                                    <Link href="Aprende/video">
                                        <button type="submit" className="theme-btn" >
                                            Formar plan de estudios
                                        </button>
                                    </Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section className="coach-section-two rel z-1 pt-10 rpt-50 pb-130 rpb-100">
                    <div className="container">
                        <div className="row justify-content-center">
                            <div className="col-xl-6 col-lg-7 col-md-8">
                                <div className="section-title text-center mb-45">
                                    <h5>Cursos realizados</h5>
                                </div>
                            </div>
                        </div>
                        <Slider {...coachSlider} className="coach-slider">
                            <div className="coach-item style-two wow fadeInUp delay-0-2s">
                                <div className="coach-image" style={{maxHeight:"200px"}}>
                                    <img src="https://s3-alpha-sig.figma.com/img/c3dc/2c9b/b81039d2bca4dd00f3292c4bcd350e02?Expires=1685318400&Signature=XQBUt-lMHnLcO0MSpnzhBnYNEAQNN8j2j7ek1HCxTAn1CGdSzDr490r-IRQaw0YaCCdkjM2WX-j60wOHeHnhe7Eau39f-iEszcKnCPqE1YHrURlpq6dAO6hh7NrASiFMlSjlCgJNkZ9mYjI8kRksqxwuEKVY6Mk5EKSdIMrHI63YAYmAVBKF5mhlI9zUSl6z9D-KYud3DGfmQxGLy5plAueLxb2jwsLYxK0tUt-oDPzsJsk9keUKvSe4dNYtluaTUIj-SF3LW0XIb1bcp30~qMpoIRp3y5wVllm3Tm9cQVu7ukaPmkjRL-Q4DlYPuICr4SP0eKREFQ8U9hoLxtBNhA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4" alt="Coach" />
                                </div>
                                <div className="coach-content">
                                    <Link href="/course-list">
                                        <a className="category">Fase 1</a>
                                    </Link>
                                </div>
                            </div>
                            <div className="coach-item style-two wow fadeInUp delay-0-4s">
                                <div className="coach-image" style={{maxHeight:"200px"}}>
                                    <img src="https://s3-alpha-sig.figma.com/img/03e1/716f/c384888b8462657757ded51504bde13f?Expires=1685318400&Signature=cHpqDX0Jj~tMxN6HME-J~ljaL-~LMhpRzkpcNq0uxhsqmqqNYEOK5d3tU20y2bWIypr8mVtbO1hZMqQwBKNIAIRt64tD4GHBE~l4oJxM5XzH4uSV4JFPUw11kHwndK7npVQrIAcnZYKNRCTyo3dzcRtxfWAIgtArY2ncBC6O4PsoxjAWL4C4V5RyZW3WF2kSUTM5dZmnM0S9yoOuAf2-f~CJ7qFS65Fs79JjJZ0J6sxpySIT~IXm1bhStc1L5qQcX7bID5rnwu2xz7uiOrWaSwkUSCF2sdCCyC5dPNmOmbjIAEU62NK89SFtekkuzMFzNQceLRzgJnBglP2b5GxhrA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4" alt="Coach" />
                                </div>
                                <div className="coach-content">
                                    <Link href="/course-list">
                                        <a className="category">Fase2</a>
                                    </Link>
                                    
                                </div>
                            </div>
                            <div className="coach-item style-two wow fadeInUp delay-0-6s">
                                <div className="coach-image" style={{maxHeight:"200px"}}>
                                    <img src="https://s3-alpha-sig.figma.com/img/8aab/e529/270ef7047412a2d38d75cf573baed828?Expires=1685318400&Signature=XjCMiey7hVAKTLJri4iwdnkCOtYLUuqKpcUB0C8uqTHiRnawFg3JnfKA5krlnRlQP7nXNkl4B2OdFyV8DUH3YP3bZU5vSuHRKOVhAautd353ovKzldhjPc38iGdVAMdguoKX6iU3Iy3LV120QzkoJrM-1q8fNKkPgfIPCnJBoNd~gEcHf1sJ17cx5bXa10H8Hdap1DZa5vbeiflpNw-z2SYLf4ewhZe-yeYWArOWp1j95IB~0XAr8loXZW3DDD0BlCae8nl7FwJtdAwdriN0IHlDbB~BMUJOg1u6qcWX0CSmsqpm3Qy11-Be~jrS-h5xlG92NWsgHbiW-TIRVuijSA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4" alt="Coach" />
                                </div>
                                <div className="coach-content">
                                    <Link href="/course-list">
                                        <a className="category">Taller de Evangelismo</a>
                                    </Link>
                                                                        
                                </div>
                            </div>
                            
                            
                        </Slider>
                    </div>
                </section>
            </Container>

        </div>

    )
}

export default MainPage