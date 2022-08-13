<%-- 
    Document   : loginmodal
    Created on : Jul 26, 2022, 10:28:34 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div id="logreg-forms" class="modal-body">
                    <form class="form-signin" action="LoginServlet" method="POST">
                        <div class="social-login">
                            <button class="btn facebook-btn social-btn btn-lg" type="button" onclick="myAlertFunction()"><span><i
                                        class="fab fa-facebook-f "></i> Sign in with Facebook</span> </button>
                            <button class="btn google-btn social-btn btn-lg" type="button"><span><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/LnF/login-google&response_type=code
                                &client_id=436470610103-69do4bd1i4j906jdtrlrtklj5l02mu2u.apps.googleusercontent.com&approval_prompt=force" style="padding-top: 0px; color:#f8f9fa;">
                                        <i class="fab fa-google-plus-g"></i> Sign in with Google+</a></span> </button>
                        </div>
                        <p style="text-align:center"> OR </p>
                        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required=""
                               autofocus="" name="email">
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password"
                            required="" name="password">

                        <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>
                            Sign in</button>
                        <a href="#" id="forgot_pswd">Forgot password?</a>
                        <hr>
                        <!-- <p>Don't have an account!</p>  -->
                        <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i
                                class="fas fa-user-plus"></i> Sign up New Account</button>
                    </form>

                    <form action="/reset/password/" class="form-reset">
                        <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required=""
                            autofocus="">
                        <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                        <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
                    </form>

                    <form class="form-signup" id="form_signup" action="SignUpServlet" method="POST">
                        <div class="social-login">
                            <button class="btn facebook-btn social-btn btn-lg" type="button" onclick="myAlertFunction()"><span><i
                                        class="fab fa-facebook-f "></i> Sign in with Facebook</span> </button>
                        </div>
                        <div class="social-login">
                            <button class="btn google-btn social-btn btn-lg" type="button"><span><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/LnF/login-google&response_type=code
                                &client_id=436470610103-69do4bd1i4j906jdtrlrtklj5l02mu2u.apps.googleusercontent.com&approval_prompt=force" style="padding-top: 0px; color:#f8f9fa;">
                                        <i class="fab fa-google-plus-g"></i> Sign in with Google+</a></span> </button>
                        </div>

                        <p style="text-align:center">OR</p>

                        <input type="text" id="user-name" class="form-control" placeholder="Full name" required=""
                            autofocus="" name="username">
                        <input type="email" id="user-email" class="form-control" placeholder="Email address" required
                            autofocus="" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                            title="Must contain @ and . example a@gmail.com/a@co.co">
                        <input type="password" id="password" class="form-control" placeholder="Password" required
                            autofocus="" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                            title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                        <input type="password" id="repeatpw" class="form-control" placeholder="Confirm Password"
                            name="repeatpw" required autofocus="">
                        <button class="btn btn-primary btn-block" type="submit" id="signup-button"><i
                                class="fas fa-user-plus"></i>
                            Sign Up</button>
                        <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
                    </form>

                </div>
            </div>
        </div>
    </div>