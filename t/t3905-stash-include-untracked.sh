	echo 1 >file &&
	echo 2 >file &&
	echo 3 >file &&
	echo 1 >file2 &&
	echo 1 >HEAD &&
	cat >expect <<-EOF &&
	?? actual
	?? expect
	EOF

	one_blob=$(echo 1 | git hash-object --stdin) &&
	tracked=$(git rev-parse --short "$one_blob") &&
	untracked_blob=$(echo untracked | git hash-object --stdin) &&
	untracked=$(git rev-parse --short "$untracked_blob") &&
	cat >expect.diff <<-EOF &&
	diff --git a/HEAD b/HEAD
	new file mode 100644
	index 0000000..$tracked
	--- /dev/null
	+++ b/HEAD
	@@ -0,0 +1 @@
	+1
	diff --git a/file2 b/file2
	new file mode 100644
	index 0000000..$tracked
	--- /dev/null
	+++ b/file2
	@@ -0,0 +1 @@
	+1
	diff --git a/untracked/untracked b/untracked/untracked
	new file mode 100644
	index 0000000..$untracked
	--- /dev/null
	+++ b/untracked/untracked
	@@ -0,0 +1 @@
	+untracked
	EOF
	cat >expect.lstree <<-EOF &&
	HEAD
	file2
	untracked
	EOF

test_expect_success 'clean up untracked/untracked file to prepare for next tests' '
	git clean --force --quiet
'
	cat >expect <<-EOF &&
	 M file
	?? HEAD
	?? actual
	?? expect
	?? file2
	?? untracked/
	EOF

	echo 1 >expect_file2 &&
	test_cmp expect_file2 file2 &&
	echo untracked >untracked_expect &&
	test_cmp untracked_expect untracked/untracked
test_expect_success 'clean up untracked/ directory to prepare for next tests' '
	git clean --force --quiet -d
'
	echo 4 >file3 &&
	four_blob=$(echo 4 | git hash-object --stdin) &&
	blob=$(git rev-parse --short "$four_blob") &&
	cat >expect <<-EOF &&
	diff --git a/file3 b/file3
	new file mode 100644
	index 0000000..$blob
	--- /dev/null
	+++ b/file3
	@@ -0,0 +1 @@
	+4
	EOF

	test_when_finished "git reset" &&
	echo 1 >file5 &&
	git stash save --include-untracked --quiet >.git/stash-output.out 2>&1 &&
	echo 1 >expect &&
	test_when_finished "rm -f expect" &&
	test_cmp expect file
	cat >.gitignore <<-EOF &&
	.gitignore
	ignored
	ignored.d/
	EOF

	echo ignored >ignored &&
	test_file_not_empty ignored &&
	test_file_not_empty ignored.d/untracked &&
	test_file_not_empty .gitignore
	echo 4 >file4 &&
	test_file_not_empty ignored &&
	test_file_not_empty ignored.d/untracked &&
	test_file_not_empty .gitignore
	cat >.gitignore <<-EOF &&
	ignored
	ignored.d/*
	EOF

	echo "!ignored.d/foo" >>.gitignore &&
test_expect_success 'stash -u -- <non-existent> shows no changes when there are none' '
	git stash push -u -- non-existent >actual &&
test_expect_success 'stash -u with globs' '
	>untracked.txt &&
	git stash -u -- ":(glob)**/*.txt" &&
	test_path_is_missing untracked.txt
'
