<script lang="ts">
  // Skeleton initialization component for proper SSR/hydration
  import { onMount } from 'svelte';
  import { storePopup } from '@skeletonlabs/skeleton';
  import { computePosition, autoUpdate, flip, shift, offset, arrow } from '@floating-ui/dom';

  onMount(() => {
    // Initialize Skeleton popup system
    storePopup.set({ computePosition, autoUpdate, flip, shift, offset, arrow });
  });
</script>

<!-- This component handles Skeleton UI initialization -->
<div style="display: none;" /> 