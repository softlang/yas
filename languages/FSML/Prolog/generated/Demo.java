// Turnstile-specific, handwritten code
public class Demo {
    public static void main(String [] args) {
	Handler handler =
	    new Handler();
	Stepper stepper =
	    new Stepper(handler);
	stepper.step(Input.ticket);
	stepper.step(Input.pass);
	stepper.step(Input.ticket);
	stepper.step(Input.pass);
	stepper.step(Input.ticket);
	stepper.step(Input.ticket);
	stepper.step(Input.pass);
	stepper.step(Input.pass);
	stepper.step(Input.ticket);
	stepper.step(Input.pass);
	stepper.step(Input.mute);
	stepper.step(Input.release);
	stepper.step(Input.ticket);
	stepper.step(Input.pass);
    }
}
