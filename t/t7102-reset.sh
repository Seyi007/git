	head5=$(git rev-parse --verify HEAD)
	git reset --hard > .actual &&
	echo HEAD is now at $hex $(commit_msg) > .expected &&
	git -c "i18n.logOutputEncoding=$test_encoding" reset --hard > .actual &&
	echo HEAD is now at $hex $(commit_msg $test_encoding) > .expected &&
>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
test_expect_success 'giving a non existing revision should fail' '
	echo "100644 44c5b5884550c17758737edcced463447b91d42b 1	un" |
test_expect_success \
	'giving paths with options different than --mixed should fail' '
test_expect_success \
	'trying to do reset --soft with pending merge should fail' '
	git checkout master &&
test_expect_success \
	'trying to do reset --soft with pending checkout merge should fail' '
	git checkout master &&
test_expect_success \
	'resetting to HEAD with no changes should succeed and do nothing' '
>.diff_expect
cat >.cached_expect <<EOF
diff --git a/secondfile b/secondfile
index 1bbba79..44c5b58 100644
--- a/secondfile
+++ b/secondfile
@@ -1 +1,2 @@
-2nd file
+1st line 2nd file
+2nd line 2nd file
EOF
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
	check_changes d1a4bc3abce4829628ae2dcb0d60ef3d1a78b1c4 &&
>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
3rd line 2nd file
EOF
test_expect_success \
	'changing files and redo the last commit should succeed' '
>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
first:
1st file
2nd line 1st file
second:
2nd file
EOF
test_expect_success \
	'--hard reset should change the files and undo commits permanently' '
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&
>.diff_expect
cat >.cached_expect <<EOF
diff --git a/first b/first
deleted file mode 100644
index 8206c22..0000000
--- a/first
+++ /dev/null
@@ -1,2 +0,0 @@
-1st file
-2nd line 1st file
diff --git a/second b/second
deleted file mode 100644
index 1bbba79..0000000
--- a/second
+++ /dev/null
@@ -1 +0,0 @@
-2nd file
diff --git a/secondfile b/secondfile
new file mode 100644
index 0000000..44c5b58
--- /dev/null
+++ b/secondfile
@@ -0,0 +1,2 @@
+1st line 2nd file
+2nd line 2nd file
EOF
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
test_expect_success \
	'redoing changes adding them without commit them should succeed' '
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e
cat >.diff_expect <<EOF
diff --git a/first b/first
deleted file mode 100644
index 8206c22..0000000
--- a/first
+++ /dev/null
@@ -1,2 +0,0 @@
-1st file
-2nd line 1st file
diff --git a/second b/second
deleted file mode 100644
index 1bbba79..0000000
--- a/second
+++ /dev/null
@@ -1 +0,0 @@
-2nd file
EOF
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&
	test "$(git rev-parse ORIG_HEAD)" = \
			ddaefe00f1da16864591c61fdc7adb5d7cd6b74e
>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
	git reset --hard ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&

>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
3rd line in branch2
EOF
>.diff_expect
>.cached_expect
cat >.cat_expect <<EOF
secondfile:
1st line 2nd file
2nd line 2nd file
EOF
test_expect_success \
	'--hard reset to ORIG_HEAD should clear a fast-forward merge' '
	git checkout master &&
cat > expect << EOF
diff --git a/file1 b/file1
index d00491f..7ed6ff8 100644
--- a/file1
+++ b/file1
@@ -1 +1 @@
-1
+5
diff --git a/file2 b/file2
deleted file mode 100644
index 0cfbf08..0000000
--- a/file2
+++ /dev/null
@@ -1 +0,0 @@
-2
EOF
cat > cached_expect << EOF
diff --git a/file4 b/file4
new file mode 100644
index 0000000..b8626c4
--- /dev/null
+++ b/file4
@@ -0,0 +1 @@
+4
EOF
	echo 1 > file1 &&
	echo 2 > file2 &&
	echo 3 > file3 &&
	echo 4 > file4 &&
	echo 5 > file1 &&
	git diff > output &&
	git diff --cached > output &&


cat > expect << EOF
Unstaged changes after reset:
M	file2
EOF

	echo 123 >> file2 &&
	git reset --mixed HEAD > output &&







	>expect &&
	test_cmp expect actual &&
	: >expect &&
	test_cmp expect actual