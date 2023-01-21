<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Your WishList</h4>
      </div>
    </div>

    <div class="row">
      <div v-for="game of games" :key="game.id" 
      class="col-md-6 col-xl-4 col-12 pt-3  justify-content-around d-flex">
        <game_list :game="game">
        </game_list>
      </div>
    </div>
  </div>
</template>

<script>
import game_list from './game_list.vue';
export default {
  data() {
      return {
          games:null,
      }
  },
  name: 'cart',
  components : {game_list},
  props : [ "baseURL"],
  methods : {
    fetchWishlist() {
      const resp = await utils.http.get("/wishlist");
        if (resp && resp.status === 200) {
          const data = await resp.json();
          if (data) {
            this.wishlist = data;
          }
        }
    }
  },
  async created() {
    await this.fetchWishlists();
  },
}
</script>

<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}
</style>
