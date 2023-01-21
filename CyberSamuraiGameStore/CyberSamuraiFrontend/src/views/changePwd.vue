<template>
  <div>
    <v-container>
      <!-- Form -->
      <form>
        <v-text-field v-show="false" v-model="ori_id" hidden></v-text-field>

        <!-- Current Password -->
        <v-text-field
          v-model="current_pwd"
          :counter="10"
          label="Current Password"
          required
          :type="passwordShow ? 'text' : 'password'"
          :append-icon="passwordShow ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="passwordShow = !passwordShow"
        ></v-text-field>

        <!-- New Password -->
        <v-text-field
          v-model="new_pwd"
          label="New Password"
          required
          :type="passwordShow ? 'text' : 'password'"
          :append-icon="passwordShow ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="passwordShow = !passwordShow"
        ></v-text-field>

        <!-- Confirm New Password -->
        <v-text-field
          v-model="con_new_pwd"
          label="Confirm New Password"
          required
          :type="passwordShow ? 'text' : 'password'"
          :append-icon="passwordShow ? 'mdi-eye' : 'mdi-eye-off'"
          @click:append="passwordShow = !passwordShow"
        ></v-text-field>

        <!-- Submit Btn -->
        <v-btn class="mr-4" @click="submit"> submit </v-btn>

        <!-- Clear Btn -->
        <v-btn @click="clear"> clear </v-btn>

        <!-- Error Alert -->
        <v-alert class="mt-3" v-show="errorAlert" dense type="error">
          {{ errMsg }} <br />
        </v-alert>
      </form>
    </v-container>
  </div>
</template>

<script>
import utils from "../utils/utils";
export default {
  name: "profile",
  components: {},
  data() {
    return {
      con_new_pwd: "",
      new_pwd: "",
      ori_id: "",
      current_pwd: "",
      errorAlert: false,
      errMsg: "",
      passwordShow: false,
    };
  },

  async created() {
    this.loginUser = this.$store.state.loginUser;
    this.$store.watch(
      () => {
        return this.$store.state.loginUser;
      },
      (newVal, oldVal) => {
        this.loginUser = newVal;
      },
      {
        deep: true,
      }
    );
  },

  methods: {
    async submit() {
      const resp = await utils.http.post("/user/changePwd", {
        ori_id: this.loginUser.id,
        current_pwd: this.current_pwd,
        new_pwd: this.new_pwd,
        con_new_pwd: this.con_new_pwd,
      });
      if (resp.status === 200) {
        this.$router.push({ path: "/" });
      } else {
        this.errorAlert = true;
        const data = await resp.json();
        this.errMsg = data.message;
      }
    },

    clear() {
      this.current_pwd = "";
      this.new_pwd = "";
      this.con_new_pwd = "";
    },
  },
};
</script>
