import Carousel from "react-bootstrap/Carousel";
import Image from "next/image";

function CarouselFadeExample() {
  return (
    <Carousel fade pause="false" style={{ width: "80vw" }} controls={false}>
      <Carousel.Item interval={1500}>
        <img 
          className="d-block w-100"
          src="/assets/images/carousel/EnciendeUnaLuz.jpg"
          alt="First slide"
          style={{ height: "70vh" } }
          layout='fill'
        />
      </Carousel.Item>
      <Carousel.Item interval={1500}>
        <img 
          className="d-block w-100"
          src="/assets/images/carousel/iglesiaCCG.jpg"
          
          alt="Second slide"
          style={{ height: "70vh" } }
          layout='fill'
        />
      </Carousel.Item>
      <Carousel.Item interval={1500}>
        <img 
          className="d-block w-100"
          src="/assets/images/carousel/TierraPrometidaNinos.jpg"
          alt="Third slide"
          style={{ height: "70vh" } }
          layout='fill'
        />
      </Carousel.Item>
    </Carousel>
  );
}

export default CarouselFadeExample;
