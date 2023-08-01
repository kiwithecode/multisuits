const Newsletters = () => {
  return (
    <div className="footer-newsletter br-10 bg-lighter">
      <div className="row">
        <div className="col-lg-6">
          <div
            className="newsletter-video bgs-cover overlay wow fadeInLeft delay-0-2s"
            style={{
              backgroundImage: "url(https://s3-alpha-sig.figma.com/img/66aa/f427/b812f4258eaf81508d4315e5b13ba3f8?Expires=1685318400&Signature=LhXgzyENz1lQZhsMso-rKO1HA5E-6P6Ew78n8gxN81qDPa8-OCQoOFVrG4L8G77dT2ZemXy8hLurfCAcPROhrpLD8CL7nLTgsVs4FnwzHpcoRfy9E7aQEFaMeQoO78Fqgysm-crZL2bNotYwMZSgfw41qB2YfLc9fySRbtaMzGPB0qpDnt5KRUvzEglMYNeoPNiHs5hahQJj-yw2Fd11KueglQtrwP0Nb3fwpFp22oflzvOQ0MICezvXF3kf9bEtPK9FtNLV95XEuG~8OAhjhSd8sO5XR3EEMNLGvuUpYt-OvELKngJTLiU-664UktoOb25ek-tPUsTpsEZmebC~Og__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4)",
            }}
          >
            <a
              href="https://www.youtube.com/watch?v=wM6PbyS1I60"
              className="mfp-iframe video-play"
            >
              <i className="fas fa-play" />
            </a>
          </div>
        </div>
        <div className="col-lg-6 align-self-center">
          <div className="newsletter-content wow fadeInRight delay-0-2s">
            <div className="section-title mb-20">
              <h2>Crecimiento y cambio</h2>
            </div>
            <form
              onSubmit={(e) => e.preventDefault()}
              className="newsletter-form mt-25"
              action="#"
            >
              <div className="newsletter-radios mb-25">
                    Programa de enseñanza bíblica disponible para todos quienes desean afirmar su fe con el conocimiento de la sana doctrina. Hay tres fases, dependiendo del nivel de conocimiento que tenga el aspirante
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};
export default Newsletters;
