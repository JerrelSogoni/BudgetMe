export class User {
  mcName;
  mcFacebookAuth;
  mcSignUpDate;

  constructor() {}

  get mcName() {
    return this.mcName;
  }

  set mcName(acName) {
    this.mcName = acName;
  }

  get mcFacebookAuth() {
    return this.mcFacebookAuth;
  }

  set mcFacebookAuth(acFacebookAuth) {
    this.mcFacebookAuth = acFacebookAuth;
  }

  get mcSignUpDate() {
    return this.mcSignUpDate;
  }

  set mcSignUpDate(acSignUpDate) {
    this.mcSignUpDate = acSignUpDate;
  }
}
