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
      if (user) {
        return done(null, user);
      }
      const newUser = await new User({ googleId: profile.id }).save();
      return done(null, newUser);
    }
  )
);
