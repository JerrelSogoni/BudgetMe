const passport = require("passport");
const mongoose = require("mongoose");
const GoogleStrategy = require("passport-google-oauth2");
const config = require("../config");
const User = mongoose.model("users");

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser((id, done) => {
  User.findById(id).then((user) => {
    done(null, user);
  });
});
passport.use(
  new GoogleStrategy(
    {
      clientID: config.googleClientOAuth.clientId,
      clientSecret: config.googleClientOAuth.clientSecretKey,
      callbackURL: "/auth/google/callback",
    },
    async (accessToken, refreshToken, profile, done) => {
      const user = await User.findOne({ googleId: profile.id });
      if (!user) {
        new User({ googleId: profile.id })
          .save()
          .then((user) => done(null, user))
          .catch((error) => console.log(error));
      } else {
        done(null, user);
      }

      console.log("access Token ", accessToken);
      console.log("refresh token  ", refreshToken);
      console.log("profile Token ", profile);
    }
  )
);
